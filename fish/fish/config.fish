# Bobthefish prompt overrides
set -g theme_display_git_master_branch yes
set -g theme_display_git_dirty yes
set -g theme_show_exit_status yes

# Theme settings
set -g theme_color_scheme base16

# Smart functions for createing and attaching tmux sessions.
function tmuxl
  tmux -2 attach\; choose-tree -s
end
function tmuxn
  if test (count $argv) -gt 0
    tmux -2 new-session -s $argv[1]
  else
    tmux -2 new-session
  end
end
function tmuxa
  if set -q TMUX
    tmux -2 switch -t $argv[1]
  else if test (count $argv) -gt 0
    tmux -2 attach-session -t $argv[1]
  else if [ (count (tmux ls 2>/dev/null)) -gt 1 ]
    tmux -2 attach\; choose-tree -s
  else
    tmux -2 attach
  end
end

# Other aliases
alias rg "npm run gulp"
alias rt "npm run tslint"
alias rc "npm run gulp css"
alias rl rc
alias rtpl "npm run gulp templates"
alias cl "claude"

# Paths
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin

# Integrate iTerm2
set -g ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX 1
source ~/.config/fish/iterm2_shell_integration.fish

# Integrate fzf
# Ctrl+T opens fzf to insert a path in the current prompt
# Alt+C CDs to a fzf directory
# Ctrl+R opens fzf to search command history
fzf --fish | source

# Integrate pyenv
pyenv init - fish | source

# Disable greeting
function fish_greeting
end
