alias vi='vim'
alias la='ls -la'

source ~/git-completion.bash

PS1="\[\033[032;040m\]\h@\u:\W\$(__git_ps1) \$ "

# Editor
export EDITOR=emacs

export SCALA_HOME=/home/username/scala
export PATH=$PATH:$SCALA_HOME/bin

export JRUBY_HOME=/home/username/jruby
export PATH=$PATH:$JRUBY_HOME/bin

export JYTHON_HOME=/home/username/jython2.5.2
export PATH=$PATH:$JYTHON_HOME/bin

export PLAY_HOME=/home/username/play-1.2.4
export PATH=$PATH:$PLAY_HOME
