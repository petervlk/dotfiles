path=(~/bin $path)

export TERM=xterm
export EDITOR=vim
export TIME_STYLE="long-iso"
export CONFIG_DIR=$HOME/.config

export XDG_CONFIG_HOME=$CONFIG_DIR
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

if [ -f $ZDOTDIR/zshenv_local ]; then
  source $ZDOTDIR/zshenv_local
fi 

export LESSHISTFILE=/dev/null

