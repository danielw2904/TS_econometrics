(TeX-add-style-hook
 "exerc3"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "leqno")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("flexisym" "cmbase")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "verbatim"
    "flexisym"
    "color"
    "breqn")
   (TeX-add-symbols
    '("isqrt" 1)
    '("iexpt" 2)
    '("isubscript" 2)
    '("ifracn" 2)
    '("ifracd" 2)
    '("ifrac" 2)))
 :latex)

