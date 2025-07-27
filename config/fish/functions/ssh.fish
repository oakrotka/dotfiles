function ssh --description "ssh override to set the appropriate TERM variable"
  if not set --query SSH_TERM
    set -fx SSH_TERM xterm
  end

  TERM=$SSH_TERM command ssh $argv
end
