;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

(setenv "LSP_USE_PLISTS" "1")

(doom! :input

       :completion
       company
       (vertico +icons)

       :ui
       doom
       doom-quit
       hl-todo
       ligatures
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
       (emacs-lisp +lsp +tree-sitter)
       graphql
       json
       (javascript +lsp +tree-sitter)
       markdown
       org
       (php +lsp +tree-sitter)
       sh
       (web +html +css +lsp +tree-sitter)
       yaml

       :config
       literate
       (default +bindings +smartparens))
