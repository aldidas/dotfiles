;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! gitconfig-mode
  :recipe (:host github :repo "magit/git-modes"
           :files ("gitconfig-mode.el")))
(package! gitignore-mode
  :recipe (:host github :repo "magit/git-modes"
           :files ("gitignore-mode.el")))
(package! csv-mode)
(package! prettier-js)
(package! exec-path-from-shell)
(package! dashboard)
(package! lorem-ipsum)
(package! hover)
(package! blamer)
(package! dimmer)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! jsdoc)
(package! multi-vterm)
(package! doom-modeline :pin "918730eff72e")
(package! catppuccin-theme)
