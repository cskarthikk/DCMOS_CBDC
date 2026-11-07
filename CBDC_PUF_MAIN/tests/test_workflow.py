import csv
import json
import sys
import tempfile
import unittest
from datetime import datetime,timezone,timedelta
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
import workflow as w


class WorkflowTests(unittest.TestCase):
    def setUp(self):
        base=(ROOT/'reports/test_runs').resolve();base.mkdir(parents=True,exist_ok=True)
        self.temp=tempfile.TemporaryDirectory(prefix='cbdc_test_',dir=base)
        if not Path(self.temp.name).resolve().is_relative_to(base):raise RuntimeError('Unsafe test cleanup path')
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)
        self.sha=w.read_json(ROOT/'BUILD_RECORD.json')['sha256']
        self.matrix=[dict(pattern=p,challenges=[1<<((c+p)%16) for c in range(8)]) for p in range(2)]

    def make_capture(self,name,day,validation=False):
        path=self.root/(name+'.csv');rows=[]
        fields='utc,variant,mode,excite_cycles,pattern,trial,core,challenge_hex,response,response_word_hex,qb_edge_seen,qu_edge_seen,flags_hex'.split(',')
        for p in range(2):
            for t in range(1,21):
                bits=[(p+c)%2 for c in range(8)]
                if p==0:bits[0]=t%2 # enrollment tie: excluded
                if p==1:bits[1]=int(t==1) # mixed: excluded
                if validation and p==0 and t==1:bits[2]^=1
                word=sum(b<<c for c,b in enumerate(bits))
                stamp=(datetime(2026,1,day,tzinfo=timezone.utc)+timedelta(seconds=20*p+t)).isoformat()
                for c,b in enumerate(bits):
                    rows.append(dict(utc=stamp,variant=w.VARIANT,mode='Parallel',excite_cycles=8,pattern=p,trial=t,core=c,challenge_hex=f'{self.matrix[p]["challenges"][c]:04X}',response=b,response_word_hex=f'{word:02X}',qb_edge_seen='',qu_edge_seen='',flags_hex='61'))
        with path.open('w',newline='') as f:
            wr=csv.DictWriter(f,fieldnames=fields);wr.writeheader();wr.writerows(rows)
        meta=dict(variant=w.VARIANT,cores=8,patterns=2,repeats=20,mode='Parallel',excite_cycles=8,sha256=self.sha,operator_confirmed_file=True)
        w.write_json(str(path)+'.metadata.json',meta);w.write_json(str(path)+'.challenges.json',self.matrix)
        return path

    def enrolled(self):
        src=self.make_capture('enroll',1);model=self.root/'enrollment/model.json'
        result=w.enroll(src,model);self.assertEqual(result['selected_positions'],14);self.assertEqual(result['excluded_positions'],2)
        return src,model

    def bound_validation(self,model):
        path=self.make_capture('validation',2,True);meta=w.read_json(str(path)+'.metadata.json')
        meta.update(enrollment_sha256=w.digest(model),challenges_file_sha256=w.digest(model.parent/'challenge_matrix.json'))
        Path(str(path)+'.metadata.json').write_text(json.dumps(meta))
        return path

    def test_end_to_end_frozen_selection_and_error_counts(self):
        src,model=self.enrolled();before=model.read_bytes();path=self.bound_validation(model)
        result=w.validate(model,path,self.root/'report')
        self.assertEqual(result['observations'],280);self.assertEqual(result['disagreements'],1)
        self.assertEqual(result['positions_with_any_disagreement'],1)
        self.assertEqual(model.read_bytes(),before)
        self.assertTrue((self.root/'report/REPORT.md').is_file())

    def test_no_overwriting_enrollment_or_reports(self):
        src,model=self.enrolled()
        with self.assertRaises(ValueError):w.enroll(src,model)
        path=self.bound_validation(model);w.validate(model,path,self.root/'report')
        with self.assertRaises(ValueError):w.validate(model,path,self.root/'report')

    def test_cannot_validate_enrollment_or_different_profile(self):
        src,model=self.enrolled()
        with self.assertRaisesRegex(ValueError,'cannot validate itself'):w.validate(model,src,self.root/'bad')
        path=self.bound_validation(model);meta=w.read_json(str(path)+'.metadata.json');meta['sha256']='0'*64
        Path(str(path)+'.metadata.json').write_text(json.dumps(meta))
        with self.assertRaisesRegex(ValueError,'Different bitstream'):w.validate(model,path,self.root/'wrong')

    def test_replay_identity_and_enrollment_binding(self):
        _,model=self.enrolled();path=self.bound_validation(model)
        meta=w.read_json(str(path)+'.metadata.json');meta['enrollment_sha256']='0'*64
        Path(str(path)+'.metadata.json').write_text(json.dumps(meta))
        with self.assertRaisesRegex(ValueError,'not bound'):w.validate(model,path,self.root/'bad')

    def test_changed_mask_and_matrix_are_rejected(self):
        _,model=self.enrolled();path=self.bound_validation(model)
        obj=w.read_json(model);obj['bits'][2]['reference']^=1;model.write_text(json.dumps(obj))
        with self.assertRaisesRegex(ValueError,'not bound'):w.validate(model,path,self.root/'changed')
        matrix=model.parent/'challenge_matrix.json';matrix.write_text('[]')
        with self.assertRaisesRegex(ValueError,'matrix changed'):w.frozen_model(model)

    def test_incomplete_or_inconsistent_raw_capture(self):
        path=self.make_capture('bad',1)
        lines=path.read_text().splitlines();path.write_text('\n'.join(lines[:-1])+'\n')
        with self.assertRaisesRegex(ValueError,'Incomplete'):w.capture(path)
        path=self.make_capture('bad_word',1)
        with path.open(newline='') as f:reader=csv.DictReader(f);fields=reader.fieldnames;rows=list(reader)
        rows[0]['response']='1' if rows[0]['response']=='0' else '0'
        with path.open('w',newline='') as f:writer=csv.DictWriter(f,fieldnames=fields);writer.writeheader();writer.writerows(rows)
        with self.assertRaisesRegex(ValueError,'bit/word mismatch'):w.capture(path)

    def test_old_or_unattested_validation_is_not_silently_accepted(self):
        _,model=self.enrolled();path=self.bound_validation(model)
        meta=w.read_json(str(path)+'.metadata.json');meta['operator_confirmed_file']=False
        Path(str(path)+'.metadata.json').write_text(json.dumps(meta))
        with self.assertRaisesRegex(ValueError,'operator confirmation'):w.validate(model,path,self.root/'unattested')
        meta['operator_confirmed_file']=True;Path(str(path)+'.metadata.json').write_text(json.dumps(meta))
        text=path.read_text().replace('2026-01-02','2025-12-31');path.write_text(text)
        with self.assertRaisesRegex(ValueError,'later capture'):w.validate(model,path,self.root/'old')


if __name__=='__main__':unittest.main(verbosity=2)
