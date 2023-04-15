# ======================================= #
# Script that parses the output of i3-msg #
# into readable jsons for the EWW BAR.    #
# ======================================= #

import os, json

HELP = ['DP-4', 'VIRTUAL-LEFT', 'VIRTUAL-RIGHT']

wks = json.loads(os.popen('i3-msg -t get_workspaces').read())
outputs = list({wk['output'] for wk in wks})
tree = []

for out in outputs:
   cur = [{'name': wk['name'],
           'visible': wk['visible'],
           'focused': wk['focused'],
           'urgent': wk['urgent']}
        for wk in wks if wk['output'] == out]
   
   tree.append({'name': out, 'wks': cur})

tree.sort(key = lambda o: o['name'])

# Note: For some reason, eww added some random chars
# before the start of the output, so now all chars before
# '!' will be cut by eww before being parsed.
print(f"!{json.dumps(tree)}")