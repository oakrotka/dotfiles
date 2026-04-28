function sedrename --description 'rename files according to a sed regex pattern'
    # this function does a dry run by default, actual renaming is hidden behind a flag.
    #
    # caveats: if a file was to be renamed to a name that occurs after it in the function arguments,
    # the second file will be overwritten and lost before its renaming could be performed.
    # sadly, this is too difficult to be avoided in a shell script, but it's a behavior that's
    # important to keep in mind.
    argparse --min-args=2 'm/move' -- $argv
    or return

    set sed_pattern $argv[1]
    # check if the pattern is correct
    sed -E $sed_pattern /dev/null
    or return

    for f in $argv[2..-1]
        set new_basename (basename $f | sed -E $sed_pattern)
        set new_name "$(dirname $f)/$new_basename"
        echo "$f -> $new_name"

        # don't move the file if its name would be unchanged
        if set -q _flag_move; and test $(realpath $f) != $(realpath $new_name)
            mv -- $f $new_name
            or set -f mv_failure
        end
    end

    if not set -q _flag_move
        printf "\nWarning: --move has not been specified, no renaming was performed.\n"
        return 3
    end

    set -q mv_failure
    and return 4

    return 0
end
