function is_defined \
  --description "prints information whether a variable is defined" --argument-names var

  argparse --min-args=1 --max-args=1 -- $argv

  if set --query $var
    echo "yes, and it is set to"
    # the arrows are so the user will be able to tell if there's any whitespace
    echo "==>$$var<=="
  else
    echo "no"
  end
end
