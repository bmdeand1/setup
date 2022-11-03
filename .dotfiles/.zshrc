for DOTFILE in `find $HOME/Projects/setup/.dotfiles ! -name '*.zshrc' ! -name '*.gitconfig'`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done