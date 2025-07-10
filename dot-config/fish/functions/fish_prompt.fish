function _catppuccin_prompt
  # an optional todo is to display a different username color if the user is root,
  # but I don't think I'm planning to use fish as a shell for the root user

  if not set -q fish_color_user; or test -z $fish_color_user
    set -f fish_color_user $catm_sapphire
  end

  if not set -q fish_color_cwd; or test -z $fish_color_cwd
    set -f fish_color_cwd $catm_pink
  end

  printf "%s %s %s%s %s %s " \
    # First arrow contains the username -- TODO: choose something more useful?
    (set_color $fish_color_user -b $catm_surface0) \
    (whoami) \
    (set_color $catm_surface0 -b $catm_surface1) \
    # Second arrow contains the working directory
    (set_color $fish_color_cwd -b $catm_surface1) \
    (prompt_pwd --full-length-dirs 2) \
    (set_color $catm_surface1 -b normal) 
end

function fish_prompt
  echo  # newline
  _catppuccin_prompt
end
