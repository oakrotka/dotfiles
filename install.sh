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

  if [ ! -d $targetdir ]; then
    echo "Error: Target $targetdir is not a directory" 1>&2
    exit 2
  fi

  if [ -e $target ] && [ ! -L $target ]; then  # test for presence of a file that is not a symlink
    echo "Skipping $filename, as it already exists at $targetdir." 1>&2
  else
    if [ -L $target ]; then
      # this is useful when moving this directory and having to relink every file
      echo "Overwriting $filename at $targetdir, as the symlink already exists." 1>&2
      rm $target
    fi

    ln -s $filepath $target
  fi
}

echo 'INSTALLING LOCAL TYPST LIBRARIES'
./typst/typst-install.sh ./typst/krommon "0.1.0"

echo
echo 'INSTALLING CONFIGURATIONS TO ~/.config'
installdir $HOME/.config ./config/fish ./config/nvim ./config/pythonrc ./config/satty

echo
echo 'INSTALLING SCRIPTS TO ~/.local/bin'
[ -d $HOME/.local/bin ] || mkdir $HOME/.local/bin/
installdir $HOME/.local/bin ./local/bin/screenshot ./local/bin/pacdeps
