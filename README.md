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
```session_dir=$(find $HOME $PERSONAL $CONFIG -mindepth 1 -maxdepth 1 -type d | fzf)```

