"""First falling wave estimate, not a metastability/transient/silicon simulator."""
import collections,csv,json,re
from pathlib import Path
root=Path(__file__).resolve().parents[1];pilot=root.parent/'array8_pilot_2026-11-07'
matrix=json.loads((pilot/'measurements/array8_728584bc78404ea993562978bf3d1e04.csv.challenges.json').read_text(encoding='utf-8-sig'))
unescape=lambda s:re.sub(r'\\(.)',r'\1',s)
def load(path):
    text=path.read_text();cells={};nets={}
    starts=list(re.finditer(r'\(CELL\s+\(CELLTYPE "([^"]+)"\)\s+\(INSTANCE ([^\n]*)\)',text))
    for j,m in enumerate(starts):
        block=text[m.end():starts[j+1].start() if j+1<len(starts) else len(text)]
        instance=unescape(m[2].strip())
        for a in re.finditer(r'\(IOPATH\s+(\S+)\s+(\S+)\s+\(([^()]+)\)\s+\(([^()]+)\)\)',block):
            cells[instance,a[1],a[2]]=[list(map(float,a[k].split(':'))) for k in (3,4)]
    for a in re.finditer(r'\(INTERCONNECT\s+(\S+)\s+(\S+)\s+\(([^()]+)\)\s+\(([^()]+)\)\)',text):
        nets[unescape(a[1]),unescape(a[2])]=[list(map(float,a[k].split(':'))) for k in (3,4)]
    return cells,nets
result={}
for corner in ('slow','fast'):
    cells,nets=load(root/f'evidence/array_{corner}.sdf')
    summaries=[]
    for core in range(8):
        b=f'gen_core[{core}].u_engine';deltas=[]
        for vector in matrix:
            challenge=vector['challenges'][core];parity=challenge.bit_count()%2;arrivals={}
            for side,arb in [('upper','D'),('lower','C')]:
                chain=f'{b}/u_core/u_chain_{side}';head=f'{chain}/gen_auto_parity_gate.u_head_gate'
                # LUT delay entries are indexed by OUTPUT rise/fall; net entries by signal rise/fall.
                transition=0 if parity else 1 # odd AND rises; even NAND falls
                total=nets[f'{b}/u_ctrl/puf_excite_o_reg/Q',head+'/I0'][0][2]
                total+=cells[head,'I0','O'][transition][2];previous=head+'/O'
                for stage in range(16):
                    bit=(challenge>>stage)&1;kind='inv' if bit else 'buf';stem=f'{chain}/gen_elem[{stage}].u_elem/gen_style_p.'
                    path=stem+'u_'+kind;mux=stem+'u_mux'
                    total+=nets[previous,path+'/I0'][transition][2]
                    if bit:transition^=1
                    total+=cells[path,'I0','O'][transition][2]
                    total+=nets[path+'/O',mux+f'/I{bit}'][transition][2]
                    total+=cells[mux,f'I{bit}','O'][transition][2];previous=mux+'/O'
                assert transition==1
                total+=nets[previous,f'{b}/u_core/u_arbiter_dff/{arb}'][transition][2]
                arrivals[side]=total
            deltas.append(arrivals['upper']-arrivals['lower'])
        summaries.append(dict(core=core,configuration_count=len(deltas),positive_delta=sum(d>0 for d in deltas),negative_delta=sum(d<0 for d in deltas),min_delta_ps=min(deltas),max_delta_ps=max(deltas)))
    result[corner]=summaries
result['limits']='First-wave rising/falling LUT/net max delays at fast/slow corners; not a measured response predictor or BER model. Ignores setup/hold resolution, analog pulse rejection, CE/edge-lock races, coupling, feedback after first wave and environmental conditions.'
(root/'evidence/first_wave_model.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
