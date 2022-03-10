;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Aldi Daswanto"
      user-mail-address "aldi@daswanto.com")

(setq doom-font (font-spec :family "Victor Mono 1.4" :size 13 :style "Regular 1.4" :weight 'normal :height 130)
      doom-variable-pitch-font (font-spec :family "Lato" :style "Light" :size 11 :weight 'normal)
      doom-serif-font (font-spec :family "Victor Mono 1.4" :size 13 :style "Italic 1.4" :weight 'normal :height 130))

(load-theme 'doom-dracula t)

(setq org-directory "~/org/")
(setq org-log-done 'time)

(setq display-line-numbers-type 'relative)
(solaire-global-mode -1)

(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))
(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(width . 180))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq evil-normal-state-tag (propertize "🐵")
      evil-insert-state-tag (propertize "🙈")
      evil-visual-state-tag (propertize "🙉")
      evil-replace-state-tag (propertize "🙊")
      evil-emacs-state-tag (propertize "🐃")
      evil-operator-state-tag (propertize "🐒")
      evil-motion-state-tag (propertize "🐒"))

(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

;; (use-package! poke-line
;;   :config
;;   (poke-line-global-mode 1)
;;   (setq-default poke-line-pokemon "charizard"))

;; (nyan-mode)

(use-package! counsel-dash)

(use-package! lorem-ipsum)

(use-package! alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))

(defun special-buffer-mode-font()
  "Set custom font for special mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Lato" :height 130))
  (buffer-face-mode))

(defun org-mode-buffer-font()
  "Set custom font for ORG mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Lato" :height 120))
  (buffer-face-mode))

(defun special-buffer-mode-mono-font()
  "Set custom monospace font for special mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Victor Mono 1.4" :height 110))
  (buffer-face-mode))

(defun disable-linum()
  "Disabled Line Numbers"
  (interactive)
  (setq display-line-numbers nil))

(defun enable-absolute-linum()
  "Enable Absolute Line Numbers"
  (interactive)
  (if (string-equal major-mode "org-mode")
      (setq display-line-numbers nil)
    (setq display-line-numbers 'absolute)
    ))

(defun enable-relative-linum()
  "Enable Relative Line Numbers"
  (interactive)
  (if (string-equal major-mode "org-mode")
      (setq display-line-numbers nil)
    (setq display-line-numbers 'relative)
    ))

(defun no-bg-vue()
  (interactive)
  (set-face-background 'mmm-default-submode-face nil))

(defun set-bidi-env ()
  (interactive)
  (setq bidi-paragraph-direction 'nil))

(add-hook! 'evil-insert-state-entry-hook 'enable-absolute-linum)
(add-hook! 'evil-insert-state-exit-hook 'enable-relative-linum)
(add-hook! 'mmm-mode-hook 'no-bg-vue)
(add-hook 'term-mode-hook 'special-buffer-mode-mono-font)
(add-hook 'vterm-mode-hook 'special-buffer-mode-mono-font)

(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook 'set-bidi-env)
(add-hook 'org-mode-hook 'org-mode-buffer-font)
(add-hook 'org-mode-hook 'disable-linum)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'writeroom-mode)
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

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(add-hook 'dart-mode-hook 'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

(use-package! dashboard
  :init
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-startup-banner "~/Pictures/living-dead.png")
  (setq dashboard-center-content t)
  (setq dashboard-set-footer t)
  (setq dashboard-items '((recents . 5)
                          (projects . 5)))
  :config
  (dashboard-setup-startup-hook))

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

(use-package! dimmer
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-mode t))

(use-package! ox-reveal
  :config
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))

(use-package! spaceline-config
  :config
  (spaceline-spacemacs-theme)
  (setq powerline-default-separator 'arrow)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (set-face-attribute 'spaceline-evil-emacs nil :foreground "#f8f8f2")
  (set-face-attribute 'spaceline-evil-insert nil :foreground "#000000")
  (set-face-attribute 'spaceline-evil-normal nil :foreground "#000000")
  (set-face-attribute 'spaceline-evil-visual nil :foreground "#FFFFFF"))

(spaceline-compile
  ; left side
  '(((persp-name
      window-number)
     :face highlight-face
     :priority 100)
    (evil-state)
    (anzu :priority 95)
    auto-compile
    ((buffer-modified buffer-size buffer-id remote-host)
     :priority 98)
    (major-mode :priority 79)
    (process :when active)
    (version-control :when active
                     :priority 78))
  ; right side
  '(which-function
    (purpose :priority 94)
    (selection-info :priority 95)
    input-method
    ((buffer-encoding-abbrev
      point-position
      line-column)
     :separator " ☕️ "
     :priority 96)
    (global :when active)
    (buffer-position :priority 99)
    (hud :priority 99)))
