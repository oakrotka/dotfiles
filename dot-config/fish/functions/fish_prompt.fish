function _catppuccin_prompt
  # an optional todo is to display a different username color if the user is root,
  # but I don't think I'm planning to use fish as a shell for the root user

  string join '' -- \
    # First arrow contains the username
    "$(set_color $catm_sapphire -b $catm_surface0) " \
    (whoami) \
    " $(set_color $catm_surface0 -b $catm_surface1)" \
    '' \
    # Second arrow contains the working directory
    " $(set_color $catm_pink -b $catm_surface1)" \
    (prompt_pwd --full-length-dirs 2) \
    " $(set_color $catm_surface1 -b normal)" \
    ' '
end

function fish_prompt
  echo  # newline
  _catppuccin_prompt
end
