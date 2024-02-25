#!/bin/bash

# Configuration
#   1. 

echo "neovim"

    # NEOVIM
    nvim_origin="$HOME/Documents/dotFiles/config/nvim"
    nvim_destination="$HOME/config/"

    # Create simbolic link
    ln -s "$nvim_origin" "$nvim_destination"

    if [$? -eq 0 ]; then
      echo "nvim added"
      sleep 5                       # 5 seg.
    else
   	echo "Error: Symbolic Link was not added... Aborting"
    fi
