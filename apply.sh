#!/bin/sh
# creates a symbolic link at every appropriate location for every dotfile in the repo.
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

  if [ -e $target -a ! -L $target ]; then  # test for presence of a file that is not a symlink
    echo "Warning: File $filename already exists at $targetdir, skipping." 1>&2
  else
    if [ -L $target ]; then
      # this is useful when moving this directory and having to relink every file
      echo "Warning: Symbolic link $filename already exists at $targetdir, overwriting." 1>&2
      rm $target
    fi

    ln -s $filepath $target
  fi
}

installdir $HOME/.config ./dot-config/fish ./dot-config/nvim ./dot-config/pythonrc
