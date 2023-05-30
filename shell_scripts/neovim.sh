#!/bin/bash

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
