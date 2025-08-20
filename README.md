# dotfiles
my dotfiles for arch linux.
I plan on keeping this repo clean, so I will gradually add more of my dotfiles here when I'll be
happy with them.
I use [catpuccin mocha theme](https://github.com/catppuccin/catppuccin) for most of my things.
feel free to take anything from here—attributions not required but very welcome.

## installation
you may want to first install the [dependencies](#dependencies).
you can install and setup this configuration on your system using the commands
```
./install.sh
./setup.sh
```
note that this creates symbolic links to this repository, so when you move it somewhere else in
your directory structure you'll have to execute the command again.

## dependencies
I do not really keep track of where a dependency is used and I listed even dependencies that are
only vaguely referenced by this config.
I do not guarantee that I haven't missed anything.

the dependencies that are in the official arch linux repos are in
[arch-dependencies.txt](./arch-dependencies.txt).
if you have pacman, you can install them using the command
```
cat arch-dependencies.txt | sudo pacman -Syu --needed -
```

as for the other dependencies:
- packages in the AUR:
  - `pfetch-rs` (you can use just pfetch instead)
  - `gleam`
- LSPs that have to be installed with the package manager of the given language:
  - [LanguageServer.jl](https://github.com/julia-vscode/LanguageServer.jl) for julia
  - [ocaml-lsp](https://github.com/ocaml/ocaml-lsp)
- [uwurandom](https://github.com/valadaptive/uwurandom) is required for the 
[uwusay](./config/fish/functions/uwusay.fish) fish function

## TODO
- [x] fish
- [ ] [make neovim usable](./config/nvim/README.md#roadmap)
- [ ] hyprland and hypr* utils
- [ ] figure out niri for my laptop
- [ ] dunst OR switch to mako
- [ ] kitty
- [ ] foot
- [ ] waybar
- [ ] mpv
- [ ] tofi
- [x] satty
- [ ] lf
