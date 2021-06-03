# Set the terminal mode to vi.
# To access the editor, try to change to the visual mode.
# (pressing 'v' after going to normal mode)
# Note: in order for this to open the vi or open vim, set the EDITOR or VISUAL
# enviroment variables. You can see an example in the Env section below.
set -o vi

# Source other files.

[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

#git completion
[[ -f "$HOME/git-completion.bash" ]] && source $HOME/git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Mostly for env variables I don't want to version control.
[[ -f "$HOME/.local_bash_profile" ]] && source "$HOME/.local_bash_profile"

[[ -f "$HOME/.local_bash_aliases" ]] && source "$HOME/.local_bash_aliases"

# Functions

function load_env_vars_from_file() {
  source "$1"
  export $(cut -d= -f1 "$1")
}

# Parse git branch.
# See the export PS1 below.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Delete local branches that were deleted on remote.
# This would also delete a branch in which the last commit message contains the
# follwing string ": gone]".
# Based on https://stackoverflow.com/a/33548037
gdelete_gone_branches() {
  git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done
}

# Env

# Configure (neo) vim as the default editor.
export EDITOR="nvim"
export VISUAL="nvim"

# Enable Erlang/Elixir shell history (https://hexdocs.pm/iex/IEx.html#module-shell-history)
export ERL_AFLAGS="-kernel shell_history enabled"

# Silence the bash deprecation warning on MacOS Catalina.
# Don't wanna move to zsh, Mac! Please, let me use my good old bash!
export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END_COLOR="\e[m"
export PS1="$BLUE\w$GREEN\$(parse_git_branch)$END_COLOR\n\$ "
export HISTSIZE=42000

# https://github.com/asdf-vm/asdf/issues/428
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
source `brew --prefix asdf`/asdf.sh

export PATH="/usr/local/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
