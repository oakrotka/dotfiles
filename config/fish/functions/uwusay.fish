function uwusay --description "uwu cowsay"
  # a potetial improvement is to allow the user to pass options into cowsay,
  # but with a simple implementation and invalid user input this will overwrite uwurandom's output 
  argparse --max-args=0 'c/bytes=?!_validate_int --min 0' -- $argv
    or return

  if test -z $_flag_bytes
    set --function _flag_bytes 100
  end

  # https://github.com/valadaptive/uwurandom
  uwurandom | head --bytes=$_flag_bytes | cowsay
end
