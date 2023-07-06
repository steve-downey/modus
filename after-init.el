;; load after processing init.el

(use-package modus-themes
  :ensure
  :demand t
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui t
        modus-themes-custom-auto-reload t
        modus-themes-disable-other-themes t

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `italic', `WEIGHT'
        modus-themes-prompts '(bold)

        ;; The `modus-themes-completions' is an alist that reads two
        ;; keys: `matches', `selection'.  Each accepts a nil value (or
        ;; empty list) or a list of properties that can include any of
        ;; the following (for WEIGHT read further below):
        ;;
        ;; `matches'   :: `underline', `italic', `WEIGHT'
        ;; `selection' :: `underline', `italic', `WEIGHT'
        modus-themes-completions '((matches . (extrabold))
                                   (selection . (semibold italic)))


        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}


        ;; The `modus-themes-headings' is an alist: read the manual's
        ;; node about it or its doc string.  Basically, it supports
        ;; per-level configurations for the optional use of
        ;; `variable-pitch' typography, a height value as a multiple of
        ;; the base font size (e.g. 1.5), and a `WEIGHT'
        modus-themes-headings
        '((1 . (variable-pitch 1.5))
          (2 . (1.3))
          (agenda-date . (1.3))
          (agenda-structure . (variable-pitch light 1.8))
          (t . (1.1))))

  ;; Subtle blue background, neutral foreground, intense blue border
  (customize-set-variable 'modus-themes-common-palette-overrides
                          '((bg-mode-line-active bg-blue-subtle)
                            (fg-mode-line-active fg-main)
                            (border-mode-line-active blue-intense)))

  ;; Make the fringe colorful, but nuanced
  (customize-set-variable 'modus-themes-common-palette-overrides
                          '((fringe bg-blue-nuanced)))

  ;; Enable underlines by applying a color to them
  (customize-set-variable 'modus-themes-common-palette-overrides
                          '((bg-paren-match bg-magenta-intense)
                            (underline-paren-match fg-main)))


  ;; Make line numbers less intense
  (customize-set-variable 'modus-themes-common-palette-overrides
                          '((fg-line-number-inactive "gray50")
                            (fg-line-number-active fg-main)
                            (bg-line-number-inactive unspecified)
                            (bg-line-number-active unspecified)))

  (defvar local-theme 'modus-vivendi-tinted)

  (setq modus-themes-to-toggle
        '(modus-vivendi-tinted modus-operandi-tinted))

  (defun local-load-theme ()
    (message "Loading modus theme %s" local-theme)
    (load-theme local-theme :no-confim))

  (when (daemonp)
    (add-hook 'server-after-make-frame-hook #'local-load-theme))

  :config
  ;; Load the theme of your choice.
  (message "Processing modus config")
  (local-load-theme)

  :bind ("<f5>" . modus-themes-toggle))

;;; after-init.el ends here
