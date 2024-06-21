# Bobthefish prompt overrides
set -g theme_display_git_master_branch yes
set -g theme_display_git_dirty yes
set -g theme_show_exit_status yes

# Theme settings
set -g theme_color_scheme base16

# Brew
set -g HOMEBREW_NO_INSTALL_CLEANUP TRUE

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

function check_and_attach_or_create_tmux
    set -l detached_sessions (tmux ls | grep -v -E '(attached)' | cut -d: -f1)
    if set -q detached_sessions[1]
        tmux attach-session -t $detached_sessions[1]
    else
        exec tmux new-session
    end
end

# Run TMUX if we aren't already in it
if status is-interactive; and not set -q TMUX
  #check_and_attach_or_create_tmux
end

