if status is-interactive
  # abbreviations I use often
  abbr --add ccp wl-copy
  abbr --add cpst wl-paste
  abbr --add gits git status
  abbr --add glon git clone --depth 1  # useful for one-time repo browsing
  abbr --add orphans pacman -Qtdq
  abbr --add pacs sudo pacman
  abbr --add pacwhich pacman -Qo
  abbr --add watch mpv --fs
  # abbreviations I use less often
  abbr --add android aft-mtp-cli
  abbr --add cpv rsync -av --progress
  abbr --add gcd cd \(git rev-parse --show-toplevel\)
  abbr --add usb lfcd /run/media/krotka

  alias lf=lfcd
end
