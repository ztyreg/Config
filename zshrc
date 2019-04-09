# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias tree='tree -C'
fi

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias  "l"="ls -ahl --full-time"

#这一段是为了解决mac的ls命令没有颜色区分的问题
if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

# typora
alias typora="open -a typora"

# connect to lab server
alias lab="ssh -p 6666 root@10.71.115.211"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/llvm/bin:$PATH"

# .
export PATH="$PATH:."

############################################################
# python
############################################################
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH="/usr/bin:$PATH"
############################################################
# typora
############################################################
alias typora="open -a typora"

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home
export PATH="/Library/Java/apache-maven-3.6.0/bin:$PATH"

# java class path
export CLASSPATH=/Users/zty/Documents/Courses/Java/MyLuceneTest/lib/*:$CLASSPATH
export PATH="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin:$PATH"

# tree
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# subl
export PATH=/Library/SublimeText/bin:$PATH

# vivado
export PATH="/Users/zty/Ubuntu/Xilinx/Vivado/2018.3/bin:$PATH"

# ctags
alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"

# course
alias cs="/Users/zty/Documents/Courses"

# mysql
alias sql="/usr/local/mysql/bin/mysql -u root -p"
alias mysql="/usr/local/mysql/bin/mysql"

# macvim
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"

# mariadb
alias mariadb="/usr/local/Cellar/mariadb/10.3.13/bin/mysql -u root -p"

# system pip
alias "systempip=/usr/local/bin/pip"

# remap c-s
# zsh
alias nvim="stty stop '' -ixoff ; nvim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
