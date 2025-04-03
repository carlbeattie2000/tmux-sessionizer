# tmux-sessionizer

### Everything fuzzy

```bash
tmux-sessionizer # Fuzzy find directory and start session
tmux-sessionizer [<partial session name>]
tmux-sessionizer -s # Fuzzy find sessions by name
```

You can change the DIRs fzf looks through here:
```bash
HOME=~/
PERSONAL=~/personal/
CONFIG=~/.config/
```
You could add more DIRs to look through here:
```
session_dir=$(find $HOME $PERSONAL $CONFIG -mindepth 1 -maxdepth 1 -type d | fzf)
```

Adding to shell as a keybind example, I am using `zsh` on MacOS:
```bash
# .zshrc
export tmux_sessionizer="/usr/local/bin/tmux-sessionizer"

bindkey -s "^f" "tmux-sessionizer\n" # Now pressing ctrl+f will open the fuzzy finder
```

Inspired by [theprimeagen/tmux-sessionizer](https://github.com/theprimeagen/tmux-sessionizer), although mine actually matches partial session names...
