(TeX-add-style-hook
 "three_four"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("geometry" "left=2cm" "right=2cm" "top=2cm" "bottom=2cm") ("setspace" "doublespacing") ("babel" "german") ("appendix" "toc" "page") ("biblatex" "style=authoryear" "backend=bibtex")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
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
    "amssymb"
    "xcolor"
    "array"
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
    "sec:constr-two-rand"
    "eq:1"
    "eq:2"
    "eq:3"
    "eq:4"
    "eq:5"
    "eq:6"
    "eq:7"
    "eq:8"
    "eq:9"
    "eq:10"
    "sec:cond-expect-vari"
    "sec:cond-expect"
    "eq:11"
    "eq:12"
    "eq:13"
    "eq:15"
    "sec:cond-vari-yx"
    "eq:16"
    "eq:17"
    "eq:18"
    "eq:19"
    "sec:problem-5"
    "eq:14"
    "eq:20"
    "eq:22"
    "eq:25"
    "sec:problem-6"
    "eq:21"
    "eq:23"
    "eq:24")
   (LaTeX-add-bibliographies
    "bibliography"))
 :latex)

