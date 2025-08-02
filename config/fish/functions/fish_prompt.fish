function _catppuccin_prompt --argument-names last_status
  if not set -q fish_color_user; or test -z $fish_color_user
    set -f fish_color_user $catm_sapphire
  end

  if not set -q fish_color_cwd; or test -z $fish_color_cwd
    set -f fish_color_cwd $catm_pink
  end

  # Prompt status only if it's not 0
  set -l status_error
  if test $last_status -ne 0
    set status_error $(set_color $fish_color_error -b $catm_surface1)"[$last_status]"
  end

  printf "%s %s %s%s %s %s%s " \
    # First arrow contains the username -- TODO: choose something more useful?
    (set_color $fish_color_user -b $catm_surface0) \
    (whoami) \
    (set_color $catm_surface0 -b $catm_surface1) \
    # Second arrow contains the working directory
    (set_color $fish_color_cwd -b $catm_surface1) \
    (prompt_pwd --full-length-dirs 2) \
    (echo $status_error) \
    (set_color $catm_surface1 -b normal) 
end

function fish_prompt
  set -l last_status $status

  echo  # newline
  _catppuccin_prompt $last_status
end
