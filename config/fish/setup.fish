#!/usr/bin/env fish
# first time setup of the fish shell

fish_config theme save catppuccin-mocha

if not contains $HOME/.local/bin $PATH
  fish_add_path $HOME/.local/bin
end
