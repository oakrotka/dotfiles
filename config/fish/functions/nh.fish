function nh --description "launch a detached program in the background"
  nohup $argv &>/dev/null &
end
