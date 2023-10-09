import os

PATTERNS = list(filter(None,map(
    lambda l:l.split('#')[0].strip(),
    open('patterns.txt').read().splitlines()
)))
CMD = 'find /System/Library/LaunchAgents /System/Library/LaunchDaemons -type f'
SERVICES = list(sorted(os.popen(CMD).read().splitlines(),key=lambda f:f.lower()))

lines = []
for service in SERVICES:
    for pattern in PATTERNS:
        if service.split('/')[-1].lower().find(pattern.lower())==0:
            lines.append(service)
open('services.txt','w').write("\n".join(lines))
