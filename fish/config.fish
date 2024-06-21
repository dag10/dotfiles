# Bobthefish prompt overrides
set -g theme_display_git_master_branch yes
set -g theme_display_git_dirty yes
set -g theme_show_exit_status yes

# Theme settings
set -g theme_color_scheme base16

# Aliases
#alias composer "php ~/software/composer/composer.phar"
alias tmuxn "tmux -2 new-session -s"
alias tmuxa "tmux -2 attach-session -t"
alias rg "npm run gulp"
alias rt "npm run tslint"
alias rc "npm run gulp css"
alias rl rc
alias rtpl "npm run gulp templates"

# Paths
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin

# Disable greeting
function fish_greeting
end
