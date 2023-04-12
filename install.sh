#!/bin/bash

## Clearing terminal
clear

echo "

    Installation:

"
echo "  Neovim environment          [1]"
echo "  Alacritty environment       [2]"
echo "  ZSH - Oh-my-zsh             [3]"
echo "  Exit                        [4]"

# Leer la entrada del usuario
read -p "Ingresa tu opción: " opcion

# Procesar la opción seleccionada
case $opcion in
  1)
    echo "neovim"

    # NEOVIM
    nvim_origin="$HOME/Documents/dotFiles/.config/nvim"
    nvim_destination="$HOME/.config/"

    # Create simbolic link
    ln -s "$nvim_origin" "$nvim_destination"

    if [$? -eq 0 ]; then
      echo "nvim added"
    else
   	echo "error"
    fi

      # Packer.nvim Installation
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ;;
  

  2)
   
    source ./shell_scripts/alacritty.sh
    ;;
  

  3)
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
    ;;
  

  4)
    echo "

    Exiting... bye bye...

    "
    # Agrega aquí el código que quieres ejecutar para la opción 4
    exit 0
    ;;
  
  
  *)
    echo "Opción inválida. Por favor, selecciona una opción válida."
    ;;
esac
