function mkcd --description "make a directory and enter it" --argument-names dir
  argparse --min-args=1 --max-args=1 -- $argv
    or return

  mkdir -p $dir
  cd $dir
end
