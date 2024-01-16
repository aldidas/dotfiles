;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Aldi Daswanto"
      user-mail-address "aldi@daswanto.com")

(setq doom-font (font-spec :family "JetBrains Mono Light 1.3" :size 14 :style "Light" :weight 'normal :height 160)
      doom-variable-pitch-font (font-spec :family "Roboto" :style "Light" :size 12 :weight 'normal)
      doom-big-font (font-spec :family "Roboto" :style "Medium" :size 32 :weight 'normal)
      doom-serif-font (font-spec :family "JetBrains Mono Light 1.3" :size 15 :style "Light Italic" :weight 'normal :height 160))

(setq-default left-margin-width 1)
(set-window-buffer nil (current-buffer))

(defun special-buffer-mode-font()
  "Set custom font for special mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Roboto" :height 130))
  (buffer-face-mode t))

(defun org-mode-buffer-font()
  "Set custom font for ORG mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "JetBrains Mono Light 1.3" :height 110))
  (buffer-face-mode t))

(defun special-buffer-mode-mono-font()
  "Set custom monospace font for special mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "JetBrains Mono Light 1.3" :height 100))
  (buffer-face-mode t))

(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)

(use-package! rainbow-mode
  :config
  (rainbow-mode t))

(use-package! dimmer
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-mode t))

(use-package! dired
  :config
  (setq dired-dwim-target t)
  (setq doom-sidebar-width 1))

(setq evil-normal-state-tag (propertize "<N>")
      evil-insert-state-tag (propertize "<I>")
      evil-visual-state-tag (propertize "<V>")
      evil-replace-state-tag (propertize "<R>")
      evil-emacs-state-tag (propertize "<E>")
      evil-operator-state-tag (propertize "<O>")
      evil-motion-state-tag (propertize "<M>"))

(use-package! doom-modeline
  :config
  (setq doom-modeline-hud t)
  (setq doom-modeline-height 35)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-vcs-max-length 100)
  (setq doom-modeline-icon nil))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(defun disable-linum()
  "Disabled Line Numbers"
  (interactive)
  (setq display-line-numbers nil))

(defun enable-absolute-linum()
  "Enable Absolute Line Numbers"
  (interactive)
  (if (or (string-equal major-mode "org-mode") (string-equal major-mode "vterm-mode"))
      (setq display-line-numbers nil)
    (setq display-line-numbers 'absolute)))

(defun enable-relative-linum()
  "Enable Relative Line Numbers"
  (interactive)
  (if (or (string-equal major-mode "org-mode") (string-equal major-mode "vterm-mode"))
      (setq display-line-numbers nil)
    (setq display-line-numbers 'relative)))

(add-hook! 'evil-insert-state-entry-hook 'enable-absolute-linum)
(add-hook! 'evil-insert-state-exit-hook 'enable-relative-linum)

(use-package! dashboard
  :init
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-startup-banner "~/Pictures/doom.png")
  (setq dashboard-center-content t)
  (setq dashboard-set-footer t)
  (setq dashboard-items '((recents . 5)
                          (projects . 5)))
  :config
  (dashboard-setup-startup-hook))

(defun shell-look ()
  (text-scale-decrease 1))
(add-hook! 'vterm-mode-hook 'shell-look)
(add-hook! 'vterm-mode-hook 'disable-linum)

(use-package! blamer
  :bind (("s-i" . blamer-show-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 140
                    :italic t))))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")
(setq org-log-done 'time)

(defun set-bidi-env ()
  (interactive)
  (setq bidi-paragraph-direction 'nil))

(defun set-org-mode ()
  (set-bidi-env)
  (disable-linum)
  (visual-line-mode)
  (+org-pretty-mode)
  (hl-line-mode 0)
  ;; (hide-mode-line-mode t)
  (setq
   header-line-format " "
   left-margin-width 4
   right-margin-width 4
   org-src-preserve-indentation nil
   org-edit-src-content-indentation 0)
  (set-window-buffer nil (current-buffer))
  (org-mode-buffer-font))
  ;; (writeroom-mode))

(setq org-hide-emphasis-markers t)
(add-hook! 'org-mode-hook 'set-org-mode)
(add-hook! 'org-mode-hook 'disable-linum)

(custom-theme-set-faces
 'user
 '(org-document-title ((t (:inherit :height 1.2))))
 '(outline-1 ((t (:inherit extra-bold :height 1.25))))
 '(outline-2 ((t (:inherit bold :height 1.15))))
 '(outline-3 ((t (:inherit bold :height 1.12))))
 '(outline-4 ((t (:inherit semi-bold :height 1.09))))
 '(outline-5 ((t (:inherit semi-bold :height 1.06))))
 '(outline-6 ((t (:inherit semi-bold :height 1.03))))
 '(outline-7 ((t (:inherit semi-bold))))
 '(outline-8 ((t (:inherit semi-bold))))
 '(outline-9 ((t (:inherit semi-bold))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-link ((t (:underline t))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))

(use-package! web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (setq web-mode-engines-alist '(("svelte" . "\\.svelte\\'"))))

(use-package! flycheck
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode)
  (global-flycheck-mode t))

(use-package! tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package! tree-sitter-langs
  :ensure t
  :after tree-sitter)

(define-derived-mode vue-mode web-mode "Vue")

;; (add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-organize-imports t t))
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)

;; (after! lsp-mode
;;   (setq lsp-go-analyses '((fieldalignment . t)
;;                           (nilness . t)
;;                           (shadow . t)
;;                           (ununsedparams . t)
;;                           (ununsedwrite . t)
;;                           (useany . t)
;;                           (ununsedvariable . t))))
;; (setq lsp-dart-sdk-dir "/Users/aldidas/flutter/bin/cache/dart-sdk")

(map! :leader
      :desc "Open dired"
      "o p" #'dired-jump)

(use-package! lorem-ipsum)

(use-package! alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

;; (getenv "PATH")
(setenv "PATH" (concat "/Library/TeX/texbin/" ":" (getenv "PATH")))

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

(use-package! exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(defun file-notify-rm-all-watches ()
  "Remove all existing file notifications watches from Emacs."
  (interactive)
  (maphash
   (lambda (key _value)
     (file-notify-rm-watch key))
   file-notify-descriptors))

(defun wrap-with-anchor-ikahan-mail (lang)
  "Wrap the highlighted text with an anchor tag using the text as the URL."
  (interactive "sEnter lang: ")
  (when (region-active-p)
    (let ((url (buffer-substring-no-properties (region-beginning) (region-end)))
          (color (cond
                  ((equal lang "id") "#000000")
                  ((equal lang "en") "#004C6E")
                  (t "#004C6E"))))
      (delete-region (region-beginning) (region-end))
      (insert (format "<a href=\"%s\" target=\"_blank\" style=\"text-decoration:underline;color:%s\">%s</a>" url color url)))))

(map! :leader
      :desc "Format Link for the IKAHAN Newsletter"
      "c a" #'wrap-with-anchor-ikahan-mail)

;; (setenv "PATH" (concat (getenv "PATH") ":/Users/aldidas/go/bin:/usr/local/go/bin"))
