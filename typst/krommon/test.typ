// this is a file that tests for all rules set in lib.typ

#import "lib.typ": *
#show: defaults

#outline()

= To jest numerowany nagłówek
Na dole wszystkich stron pokazują się ich numery, margines strony wynosi 15 milimetrów,
a strona jest w formacie A4.
`Tekst o stałej szerokości` działa.
Z obecną czcionką działa nie tylko tryb matematyczny w środku linii $f$, ale również pełne równania
$ f = log(sin((pi x) / 2)) $ <eq>

Tekst jest ładnie wyjustyfikowany, co można zobaczyć na przykładzie:

#lorem(50)

= Grid
Elementy w gridzie są w rozsądnej odległości od siebie.

#figure(
  grid(columns: 2,
    ..for _ in range(4) {(
      rect(width: 100%, height: 7em),
    )}
  ),
  caption: [Grid z elementami w rozsądnej odległości od siebie.]
) <testgrid>

= Tabela
#figure(
  table(
    columns: (1fr,) * 2,
    [Tekst w tabelach jest:], $a$,
    ..([Wyśrodkowany], [Niewyjustyfikowany]).zip(($b$, lorem(50))).flatten()
  ),
  caption: [Tabela z rozsądnie sformatowanymi elementami.]
)

#set page(height: auto)
= Linki i referencje
Ta sekcja zawiera dostosowaną wysokość strony dla wygody przewijania.
Przy okazji zwróć uwagę na numerację stron.

Przy domyślnych ustawieniach zachodzą poniższe zasady:
- referencje używają domyślnego formatowania - @testgrid
- #link(<testgrid>)[linki wewntęrzne] używają formatowania dla linków
- #link("https://linki-zewnetrzne.pl") używają formatowania dla linków

#show: defaults.with(highlight-refs: true)
#set page(height: auto)
Gdy użyta jest flaga `highlight-refs`, następujące zasady zachodzą:
- referencje używają formatowania dla linków - @testgrid
- #link(<testgrid>)[linki wewntęrzne] używają formatowania dla linków
- #link("linki-zewnetrzne.pl") używają formatowania dla linków

// sadly you cannot override previous show rules so the links are still blue and underlined here
#show: defaults.with(link-highlighter: emph, highlight-refs: true)
#set page(height: auto)
Gdy zmieniona jest wartość `link-highlighter` na funkcję do formatowania linków:
- referencje korzystają z niej, jeśli `highlight-refs` jest ustawione - @testgrid
- #link(<testgrid>)[linki wewntęrzne] korzystają z niej
- #link("linki-zewnetrzne.pl") korzystają z niej

