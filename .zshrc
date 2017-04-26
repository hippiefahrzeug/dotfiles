# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#export PATH=$PATH:${HOME}/projects/dependencies/gradle-1.0-milestone-3/bin
export PATH=$PATH:${HOME}/bin
export PATH=$PATH:${GRADLE_HOME}/bin

alias kungfu="cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 9 | head -n 1 | sed 's/\(..\)\(...\)\(....\)/\1-\2-\3/'"
alias branch="sed ':a;N;$bash;s/\n/ /g' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | sed -e 's/[^a-zA-Z0-9]/_/g' | sed ':a;N;$bash;s/\n/ /g' | sed s/\ /_/ | sed -e 's/^/git checkout -b feature\/alvi_/' | sed s/NTP_/NTP-/ | sed s/__/_/g"
alias engage='play -n synth whitenoise band -n 100 24 band -n 300 100 gain +20'
alias la="ls -al"
alias ll="ls -l"
alias x="emacs"
alias h="history"
alias alog='~/adt-bundle-mac-x86_64-20130522/sdk/platform-tools/adb logcat | grep `~/adt-bundle-mac-x86_64-20130522/sdk/platform-tools/adb shell ps | grep mobino | cut -c10-15`'
alias twitter='perl ~/bin/oysttyer/oysttyer.pl'
alias gqview='geeqie'
alias difftool='git difftool --dir-diff'
setopt autocd
setopt nobeep
setopt menucomplete
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt NO_SHARE_HISTORY

hide () {
    openssl des3 -salt -in $1 -out $1.crypt
}

unhide () {
    openssl des3 -d -salt -in $1 -out `echo $1 | sed s/.crypt//`
}

export VISUAL=vi
export EDITOR="$VISUAL"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/home/alvi/bin/apache-ant-1.9.2/bin
export PATH=$PATH:/home/alvi/android-sdk-linux/platform-tools
export PATH=$PATH:/home/alvi/android-sdk-linux/tools
export PATH=$PATH:/usr/local/bin

export PATH=/opt/jdk1.8.0_92/bin:$PATH

### Added by the Heroku Toolbelt
