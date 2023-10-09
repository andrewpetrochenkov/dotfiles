import os

lines = []
for service in open('services.txt').read().splitlines():
    lines.append('sudo launchctl unload -w %s' % service)
    lines.append('launchctl unload -w %s' % service)
open('launchctl-unload.txt','w').write("\n".join(lines))

lines = []
for service in open('services.txt').read().splitlines():
    if 'LaunchDaemons' in service:
        lines.append('launchctl load -w %s' % service)
    else:
        lines.append('launchctl load -w %s' % service)
open('launchctl-load.txt','w').write("\n".join(lines))
