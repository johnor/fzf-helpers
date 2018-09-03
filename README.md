# fzf-helpers
Functions and key bindings for using fzf with git and hg.
git bindings are based on this gist: https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236

## Installation
### Zsh with zplug
```
zplug "johnor/fzf-helpers", defer:3
```

### Bash
```
git clone https://github.com/johnor/fzf-helpers.git ~/.fzf-helpers
```

Open ~/.bashrc and add the following:
```
[ -f ~/.fzf-helpers/keybindings.bash ] && source ~/.fzf-helpers/keybindings.bash
```

