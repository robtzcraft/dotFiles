#!/bin/bash

echo "ZSH - Oh-my-zsh"
    # oh-my-zsh 
    zshrc_origin="$HOME/Documents/dotFiles/.config/zsh/.zshrc"
    zshrc_destination="$HOME"

    # Create simbolic link
    ln -s "$zshrc_origin" "$zshrc_destination"

    # verificar si se creó exitosamente
    if [ $? -eq 0 ]; then
    	echo ".zshrc added"

      sleep 2

      # sudo npm install -g typewritten

      typewritten_origin=/usr/lib/node_modules/typewritten/typewritten.zsh-theme
      typewritten_destination=$HOME/.oh-my-zsh/themes/

      ln -s "$typewritten_origin" "$typewritten_destination"

      if [ $? -eq 0 ]; then
        echo "typewritten theme added"
      else
        echo "error"
      fi

    else
    	echo "error"
    fi
