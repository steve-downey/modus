;; load before processing rest of init.el

;; remove themes that have been loaded before loading a new one
(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))
