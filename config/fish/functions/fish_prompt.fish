function fish_prompt
  set -l last_status $status
  echo  # newline

  if test "$TERM" = linux
    _ansi_prompt $last_status
  else
    _catppuccin_prompt $last_status
  end
end

function _catppuccin_prompt --argument-names last_status
  printf "%s %s %s%s %s %s%s " \
    # First arrow contains the username -- TODO: choose something more useful?
    (set_color 74c7ec -b 313244) \
    (whoami) \
    (set_color 313244 -b 45475a) \
    # Second arrow contains the working directory
    (set_color f5c2e7) \
    (prompt_pwd --full-length-dirs 2) \
    # Information about the last exit status
    (if test "$last_status" -ne 0
      set_color red
      printf "[$last_status]"
    end) \
    (set_color 45475a -b normal) 
end

function _ansi_prompt --argument-names last_status
  printf "%s%s %s> " \
    (set_color cyan) \
    (prompt_pwd --full-length-dirs 2) \
    (if test "$last_status" -ne 0
        set_color magenta
        printf "[$last_status] "
        set_color cyan
    end)
end
