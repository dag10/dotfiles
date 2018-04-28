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
#set PATH ~/Library/Android/sdk/platform-tools $PATH
set PATH /usr/local/bin $PATH
#set PATH /Applications/Argyll_V2.0.0/bin $PATH

# Disable greeting
function fish_greeting
end
