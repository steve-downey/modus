;; load after processing init.el

(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui t
        modus-themes-custom-auto-reload t

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `background', `bold', `gray', `intense', `italic'
        modus-themes-prompts '(intense bold)

        ;; The `modus-themes-completions' is an alist that reads three
        ;; keys: `matches', `selection', `popup'.  Each accepts a nil
        ;; value (or empty list) or a list of properties that can include
        ;; any of the following (for WEIGHT read further below):
        ;;
        ;; `matches' - `background', `intense', `underline', `italic', WEIGHT
        ;; `selection' - `accented', `intense', `underline', `italic', `text-also' WEIGHT
        ;; `popup' - same as `selected'
        ;; `t' - applies to any key not explicitly referenced (check docs)
        ;;
        ;; WEIGHT is a symbol such as `semibold', `light', or anything
        ;; covered in `modus-themes-weights'.  Bold is used in the absence
        ;; of an explicit WEIGHT.
        modus-themes-completions '((matches . (extrabold))
                                   (selection . (semibold accented))
                                   (popup . (accented intense)))


        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}


        modus-themes-headings ; this is an alist: read the manual or its doc string
        '((1 . (overline background variable-pitch 1.3))
          (2 . (rainbow overline 1.1))
          (t . (semibold))))

  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-intense)

  ;; Subtle blue background, neutral foreground, intense blue border
  (setq modus-themes-common-palette-overrides
        '((bg-mode-line-active bg-blue-subtle)
          (fg-mode-line-active fg-main)
          (border-mode-line-active blue-intense)))

  ;; Make the fringe colorful, but nuanced
  (setq modus-themes-common-palette-overrides
        '((fringe bg-blue-nuanced)))

  ;; Enable underlines by applying a color to them
  (setq modus-themes-common-palette-overrides
        '((bg-paren-match bg-magenta-intense)
          (underline-paren-match fg-main)))


  ;; Make line numbers less intense
  (setq modus-themes-common-palette-overrides
        '((fg-line-number-inactive "gray50")
          (fg-line-number-active fg-main)
          (bg-line-number-inactive unspecified)
          (bg-line-number-active unspecified)))

  (setq modus-themes-to-toggle
        '(modus-operandi-tinted modus-vivendi-tinted))
  :config
  ;; Load the theme of your choice.
  (load-theme 'modus-vivendi-tinted :no-confim)
  :bind ("<f5>" . modus-themes-toggle))

;;; after-init.el ends here
