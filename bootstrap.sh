#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

for file in $(ls -1 | grep -v "bootstrap.sh" | grep -v "README" | grep -v ".sublime-settings"); do
    # Vimified
    if [[ $file == *.vimrc ]] && [ -e "$HOME/vimified" ]; then
        ln -sv "$DOTFILES/$file" "$HOME/vimified/$file"
        continue
    fi

    # Symbolic link already exists, interactive overwrite
    if [ -L "$HOME/.$file" ]; then
        ln -siv "$DOTFILES/$file" "$HOME/.$file"
        continue
    fi
    # Regular file already exists, rename to .old and then create symbolic link
    if [ -f "$HOME/.$file" ]; then
        echo ".$file already exists in $HOME, renaming to $file.old"
        mv "$HOME/.$file" "$HOME/$file.old"
        ln -sv "$DOTFILES/$file" "$HOME/.$file"
        continue
    fi
    # Normal case, no file or link exists, create symbolic link
    ln -sv "$DOTFILES/$file" "$HOME/.$file"
done

exit 0

