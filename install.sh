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
echo "  Execute Diagnostics         [5]"

# Leer la entrada del usuario
read -p "Ingresa tu opción: " opcion

# Procesar la opción seleccionada
case $opcion in
  1)
    source ./shell_scripts/neovim.sh
    ;;
  
  2)
    source ./shell_scripts/alacritty.sh
    ;;
  
  3)
    source ./shell_scripts/oh_my_zsh.sh
    ;;
  
  4)
    echo "

    Exiting... bye bye...

    "
    exit 0
    ;;
  5)
    echo "Execute Diagnostics"
    ;;
  *)
    echo "Opción inválida. Por favor, selecciona una opción válida."
    ;;
esac
