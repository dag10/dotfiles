# Drew's Dotfiles

## Usage
1. Restore your safely backed up ssh keys to `~/.ssh/`
    1. Alternatively, generate new ssh keys, and add these to your GitHub account
2. Manually sign in to the Mac App Store
3. Install Homebrew and git

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.profile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.profile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ```
4. Clone this repository

  ```
  brew install git
  git clone git@github.com:dag10/dotfiles.git
  ```
5. Run the `bootstrap.sh` script
    1. Alternatively, only run the `setup.sh` scripts in specific subfolders if you don't need everything

## Contents

### Root (/)
* bootstrap.sh - Calls all setup.sh scripts

### User Bin (bin/)
* setup.sh - Symlinks the other contents of the folder to `~/bin/`
* imgcat - A utility to display images inline in iTerm 2
* sethidden - A shell script which takes command line arguments to show or hide
hidden files
* togglehidden - A shell script that toggles between showing and hiding hidden
files

### Duti (duti/)
* setup.sh - Sets the defaults set up in the different files
* app.package.id - Contains all extensions for the specified program

### Fish (fish/)
* setup.sh - Symlinks all fish files to their corresponding location in `~/.config/fish/`
* config.fish - Global fish configuration (.fishrc)
* completions/
  * conda.fish - Contains completions to all `conda` commands
  * repo.fish - Contains all repos as completions for the `repo` command
  * repodir.fish - Contains all repos as completions for the `repodir` command
* functions/
  * abbrex.fish - Utility for expanding abbreviations in fish-scripts
  * clear.fish - Clears the screen and shows fish_greeting
  * emptytrash.fish - Empties trash and clears system logs
  * fish_greeting.fish - My personal fish greeting using the
  full-colour fish logo
  * fish_prompt.fish - The Classic + Git prompt from the fish web config
  * forrepos.fish - Executes a passed command for all repos in `~/repos`
  * ls.fish - Calling ls with parameter --color=auto
  * pubkey.fish - Copies the public key to the clipboard
  * repo.fish - Finds a repository in `~/repos` and jumps to it
  * repodir.fish - Finds a repository in `~/repos` and prints its path
  * setup.fish - Initial setup for a new fish installation,
  contains abbreviations
  * update.fish - Installs OS X Software Updates, updates Ruby gems, Homebrew,
  npm, and their installed packages
  * week.fish - Returns the current week number

### Git (git/)
* setup.sh - Symlinks all git files to `~/`
* .gitignore_global - Contains global gitignores, such as OS-specific files and
several compiled files
* .gitconfig - Sets several global Git variables

### macOS Preferences (macos/)
* setup.sh - Executes a long list of commands pertaining to macOS Preferences

### Packages (packages/)
* setup.sh - Installs the contents of the .list files and the Brewfile

### Helper Scripts (scripts/)
* functions.sh - Contains helper functions for symlinking files and printing
  progress messages

### Vim (vim/)
* setup.sh - Symlinks all vim files to `~/`
* .vimrc - Basic Vim configuration

### Visual Studio Code (vscode/)
* setup.sh - Symlinks the settings.json file to `~/Library/Application Support/Code/User`
* settings.json - Contains user settings for Visual Studio Code
