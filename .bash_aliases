alias ls='ls -alGH'

# Git
# (Yeah, I know, I should probably use git aliases,
# but I didn't know it was a thing when I started this)
alias g='git'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git checkout'
alias gl='git log'
alias gl1='git log -1'
alias gpf='git push --force-with-lease'
alias gpr='git pull --rebase'
alias gammend-push-all='git add . && git commit --ammend --no-edit && gpf'

# Vim
# (Yeah, I frequently mistype ivm)
alias v='vim'
alias ivm='vim'

# Manage dotfiles
alias gdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Display an alert on MacOS
alias alert='osascript -e "display notification \"Stuff is done.\" with title \"Back to work!\""; tput bel'

# Ruby/Rails
alias rc='bundle exec rails c'
alias rs='bundle exec rails s'
alias drake='bundle exec rake db:migrate && RAILS_ENV=test bundle exec rake db:migrate'
alias upmaster='git checkout master && git pull && bundle drake && git checkout -'
alias ralert="bin/rspec;alert" # MacOS dependent

# Elixir/Phoenix
alias iphx="iex -S mix phx.server"
alias itest="iex -S mix test"

alias imgcat='~/.imgcat.sh' # show an image right in the terminal
alias myip='curl ipecho.net/plain;echo' # prints external ip


