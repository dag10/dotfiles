# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/drew/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/drew/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Theme settings
set -g theme_color_scheme base16

# Aliases
alias composer "php ~/software/composer/composer.phar"
alias tmuxn "tmux -2 new-session -s"
alias tmuxa "tmux -2 attach-session -t"
alias rg "npm run gulp"
alias rt "npm run tslint"
alias rc "npm run gulp css"
alias rl rc
alias rtpl "npm run gulp templates"

# Paths
set PATH ~/Library/Android/sdk/platform-tools $PATH
set PATH /usr/local/bin $PATH
set PATH /Applications/Argyll_V2.0.0/bin $PATH

# For Data Management class
function pastepopulate
  pbpaste | sshpass -p "fire5purple5Lion" ssh p320-02d@reddwarf.cs.rit.edu 'cat > ~/Data_Management_Project/populate.sql'
end
function copypopulate
  sshpass -p "fire5purple5Lion" scp -r p320-02d@reddwarf.cs.rit.edu:~/Data_Management_Project/populate.sql /dev/stdout | pbcopy
end
function definitions
  sshpass -p "fire5purple5Lion" scp -r p320-02d@reddwarf.cs.rit.edu:~/Data_Management_Project/create_tables.sql /dev/stdout
end

