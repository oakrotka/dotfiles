if status is-interactive
    # abbreviations I use often
    abbr --add ccp wl-copy
    abbr --add cpst wl-paste
    abbr --add gits git status
    abbr --add gitds git diff --staged
    abbr --add pacs sudo pacman
    abbr --add pacwhich pacman -Qo
    # abbreviations I use less often
    abbr --add android aft-mtp-cli
    abbr --add cpv rsync -av --progress
    abbr --add gcd cd \(git rev-parse --show-toplevel\)
    abbr --add glon git clone --depth 1  # useful for one-time repo browsing
    abbr --add orphans pacman -Qtdq
    abbr --add usb lfcd /run/media/krotka
    abbr --add watch mpv --fs

    alias lf=lfcd
end
