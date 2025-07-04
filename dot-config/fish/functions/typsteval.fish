function typsteval --description "compile typst code provided as arguments and print the result"
  set -f output_file /tmp/temporary-typst-file-$(random).pdf
  echo $argv | typst c - $output_file
  # requires poppler,
  # if I were ever to uninstall it then the alternative it to add --open to the command above
  string trim -r -- "$(pdftotext $output_file -)"
end
