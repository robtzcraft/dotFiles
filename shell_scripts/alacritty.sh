#!/bin/bash
# Alacritty

echo "alacritty environment"

# Nombre del paquete de AUR a verificar
package="alacritty"
package_2="Oh-My-Zsh"

echo "Running diagnostics...

"
sleep 2

if pacman -Qi "$package" &>/dev/null; then
  echo -e "$package package installed...................[\033[32m\u2714\033[0m]"
else
  echo -e "$package package not installed...............[\033[31m\u2718\033[0m]"
fi

if [ -d ~/.oh-my-zsh ]; then
  echo -e "$package_2 package installed...................[\033[32m\u2714\033[0m]"
else
  echo -e "$package_2 package not installed...............[\033[31m\u2718\033[0m]"
fi

# Verificar si el paquete está instalado
if pacman -Qi "$package" &>/dev/null; then
  echo ""
else
  echo "Executing installation for $package..."
  
  # Installation
  sudo pacman -S $package

  if pacman -Qi "$package" &>/dev/null; then
    echo -e "$package package installed...................[\033[32m\u2714\033[0m]"
  else
    echo "Unknown error during installation, please try to install $package manually."
  fi
fi

if [ -d ~/.oh-my-zsh ]; then
  echo
else
  echo "Executing installation for $package_2..."

  # Installation
  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi
