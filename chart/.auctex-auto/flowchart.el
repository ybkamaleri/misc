(TeX-add-style-hook
 "flowchart"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("standalone" "border=50pt")))
   (TeX-run-style-hooks
    "latex2e"
    "standalone"
    "standalone10"
    "tikz"
    "fancyhdr")
   (TeX-add-symbols
    "circledarrow"))
 :latex)

