#let defaults(
  fancy-font: true,
  highlight-refs: false,
  link-highlighter: l => underline(text(fill: blue, l)),
  body
) = {
  set text(lang: "pl")
  
  set text(font: "TeX Gyre Schola") if fancy-font
  // the rendering of this font is sometimes weird (particularily on firefox + linux),
  // so I may consider changing it in the future
  show math.equation: set text(font: "TeX Gyre Schola Math") if fancy-font
  show raw: set text(font: "JetBrains Mono NL", size: 1.05em) if fancy-font

  set page(margin: 15mm, numbering: "1", paper: "a4")
  set heading(numbering: "1.")

  set grid(column-gutter: 1em, row-gutter: 1em)
  set table(align: center + horizon)

  set par(justify: true)
  show table: set par(justify: false)
  set table.cell(breakable: false)  // maybe reconsider?

  show ref: if highlight-refs {link-highlighter} else {x => x}
  show link: link-highlighter

  body
}

#import "@preview/zero:0.4.0": num
#import "@preview/oxifmt:1.0.0": strfmt 
// prettily show a number with a certain precision in a scientific form
#let scient(f, prec: 3) = strfmt("{:." + str(prec) + "e}", f)
