### Examples
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

### Links
+   [Dotfile madness](https://0x46.net/thoughts/2019/02/01/dotfile-madness/)
+   [pre-commit - A framework for managing and maintaining multi-language pre-commit hooks](https://github.com/pre-commit/pre-commit)

