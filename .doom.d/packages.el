;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
(package! gitconfig-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitconfig-mode.el")))
(package! gitignore-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitignore-mode.el")))
(package! csv-mode)
(package! vue-mode)
(package! graphql-mode)
(package! prettier-js)
(package! exec-path-from-shell)
(package! counsel-dash)
(package! dashboard)
(package! lorem-ipsum)
(package! nyan-mode)
(package! poke-line)
(package! lsp-mode)
(package! lsp-dart)
(package! lsp-ui)
(package! hover)
(package! lsp-treemacs)
(package! spaceline)
(package! blamer)
(package! spacemacs-theme)
(package! dimmer)
(package! ox-reveal)
