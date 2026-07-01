copy all dotfiles to home folder:

```bash
$ rsync -a --no-links ~/git/dotfiles/.[^.]* ~
```

copy `.bin/*` to `~/.bin`
```bash
find .bin -type f -exec cp {} ~/.bin \;
```

make `~/.bin/*` executable
```bash
find ~/.bin -type f -exec chmod +x {} \;
```

```bash
$ find -H ~/git -type d -mindepth 1 -maxdepth 1 -exec ln -hfns ~/.repo-scripts {}/.scripts \;
```
