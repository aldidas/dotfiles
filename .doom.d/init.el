;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

(doom! :input
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company
       (vertico +icons)

       :ui
       doom
       doom-quit
       hl-todo
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces
       modeline
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       multiple-cursors
       word-wrap

       :emacs
       (dired +ranger +icons)
       electric
       ibuffer
       undo
       vc

       :term
       vterm

       :checkers
       syntax

       :tools
       editorconfig
       (eval +overlay)
       lookup
       lsp
       tree-sitter
       magit

       :os
       (:if IS-MAC macos)

       :lang
       ;; (dart +flutter +lsp)   ; paint ui and not much else
       (emacs-lisp +lsp +tree-sitter)
       graphql
       json
       (javascript +lsp +tree-sitter)
       (lua +lsp +tree-sitter)
       markdown
       org
       (php +lsp +tree-sitter)
       (python +lsp +pyright +tree-sitter)
       (ruby +lsp +tree-sitter)
       (go +lsp +tree-sitter)
       sh
       (web +html +css +lsp +tree-sitter)
       yaml

       :config
       literate
       (default +bindings +smartparens))
