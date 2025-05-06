;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "aspectratio=169" "10pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("fancybox" "") ("graphicx" "") ("hyperref" "") ("url" "") ("tikz" "") ("booktabs" "") ("enumitem" "") ("listings" "") ("pdfpages" "") ("lstautogobble" "") ("tcolorbox" "listings" "skins" "breakable" "xparse") ("xpatch" "") ("xcolor" "") ("realboxes" "") ("subcaption" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "fontenc"
    "fancybox"
    "graphicx"
    "hyperref"
    "url"
    "tikz"
    "booktabs"
    "enumitem"
    "listings"
    "pdfpages"
    "lstautogobble"
    "tcolorbox"
    "xpatch"
    "xcolor"
    "realboxes"
    "subcaption")
   (LaTeX-add-xcolor-definecolors
    "my_red")
   (LaTeX-add-tcolorbox-tcbuselibraries
    "theorems"))
 :latex)

