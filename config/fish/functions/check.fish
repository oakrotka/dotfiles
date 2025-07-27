function check \
  --description "Waits a certain period, then prints data about the focused window" \
  --argument-names wait_time

  argparse --max-args=1 -- $argv
    or return
  
  # Default value is 2
  if test -z $wait_time
    set --function wait_time 2
  end

  switch $DESKTOP_SESSION
    case hyprland
      sleep $wait_time
      hyprctl activewindow
    case '*' 
      echo "Error: Window manager not recognised or unsupported." 1>&2
      echo "Try setting the DESKTOP_SESSION enviroment variable." 1>&2
      return 1
  end
end
