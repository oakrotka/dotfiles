#!/bin/sh
# installs every file in the user's system,
# usually by creating a symbolic link at every appropriate location for every dotfile in the repo.
# may overwrite symbolic links at target destinations

installdir() {
  dest=$1
  shift

  for file in $@; do
    try_installfile $file $dest
  done
}

try_installfile() {
  if [ $# -ne 2 ]; then
    echo "Error: Expected 2 arguments to try_installfile, got $# " 1>&2
    exit 1
  fi

  filename=$(basename $1)
  filepath=$(realpath $1)
  targetdir=$(realpath $2)
  target="$targetdir/$filename"

  if [ ! -d "$targetdir" ]; then
    echo "Error: Target $targetdir is not a directory" 1>&2
    exit 2
  fi

  # test for presence of a non-symlink file
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "$1: skipping, as a file already exists at $targetdir." 1>&2
    return
  fi

  # if the file at the destination is a symlink, decide whether to overwrite it
  if [ -L "$target" ]; then
    if [ "$(readlink -f $target)" = "$filepath" ]; then
      return
    else
      echo "$1: overwriting symlink at $target" 1>&2
    fi
  fi

  ln -sf $filepath $target
}

./typst/typst-install.sh ./typst/krommon "0.1.0"

installdir $HOME/.config ./config/fish ./config/nvim ./config/pythonrc ./config/satty

[ -d $HOME/.local/bin ] || mkdir $HOME/.local/bin/
installdir $HOME/.local/bin ./local/bin/screenshot 
installdir $HOME/.local/bin ./local/bin/pacdeps ./local/bin/:3 ./local/bin/checkwindow
installdir $HOME/.local/bin ./local/bin/typsteval
