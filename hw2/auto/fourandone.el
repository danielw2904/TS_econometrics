(TeX-add-style-hook
 "fourandone"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("geometry" "left=2cm" "right=2cm" "top=2cm" "bottom=2cm") ("setspace" "doublespacing") ("babel" "german") ("appendix" "toc" "page") ("biblatex" "style=authoryear" "backend=bibtex")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "fontenc"
    "inputenc"
    "geometry"
    "setspace"
    "multicol"
    "csquotes"
    "babel"
    "amsmath"
    "graphicx"
    "cancel"
    "xcolor"
    "array"
    "unicode-math"
    "longtable"
    "booktabs"
    "dcolumn"
    "rotating"
    "appendix"
    "fancyhdr"
    "biblatex")
   (TeX-add-symbols
    '("Ccancel" ["argument"] 1)
    "lagr")
   (LaTeX-add-labels
    "eq:1"
    "eq:2"
    "eq:3"
    "eq:4"
    "eq:5"
    "eq:6"
    "eq:7"
    "eq:8")
   (LaTeX-add-bibliographies
    "bibliography"))
 :latex)

