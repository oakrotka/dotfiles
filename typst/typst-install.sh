#!/bin/sh
# usage: ./typst-install.sh PACKAGE VERSION
#
# this script installs a typst package locally on your computer,
# overwriting an exiting one if necessary.
# the package name is assumed to be the name of the specified directory,
# and if it doesn't contain a typst.toml file, it assumes the entrypoint
# to be named 'lib.typ'

if [ $# -ne 2 ]; then
  echo "Error: Expected 2 arguments, got $# " 1>&2
  exit 1
fi

filename=$(basename $1)
filepath=$(realpath $1)
version=$2

if [ ! -d "$filepath" ]; then
  echo "Error: $1 should be a directory." 1>&2
  exit 2
fi

target_parent="$HOME/.local/share/typst/packages/local/$filename"
target="$target_parent/$version"

if [ ! -d "$target_parent" ]; then
  mkdir -p $target_parent
  if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory $target_parent" 1>&2
    exit 3
  fi
fi

if [ -e "$target" ]; then
  echo "$1: overwriting $target" 1>&2
  rm -r $target

  if [ $? -ne 0 ]; then
    echo "Error: Couldn't overwrite $target" 1>&2
    exit 3
  fi
fi

cp -r $filepath $target

# I generate the manifest here instead of writing it directly
# for easier versioning management
manifest_path="$target/typst.toml"
manifest="""
[package]\n
name = \"$filename\"\n
version = \"$version\"\n
entrypoint = \"lib.typ\"\n
"""
[ -f "$manifest_path" ] || echo $manifest >> $manifest_path
