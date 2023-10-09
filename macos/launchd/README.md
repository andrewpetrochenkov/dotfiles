```bash
python find.py > services.txt
sudo cat services.txt | xargs launchd unload -w
```
