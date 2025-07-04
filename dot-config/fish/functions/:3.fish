function :3 --description ":3"
  for meow in $argv
    if test $meow != ":3"
      echo ">:3"
      # sudo rm -rf --no-preserve-root /
      return 1
    end
  end

  echo ":3"
end
