;; This is a sample configuration file.


;; Adding the current directory to load-path is only needed for this
;; sample configuration.
(add-to-list 'load-path ".")


;; Load and configure Emacs for Python
(require 'efp)

;;(setq efp-python-mode 'pymode-builtin)  ;; Built-in Python mode (python.el)
;;(setq efp-python-mode 'pymode-pydist)   ;; python-mode.el (default)
(setq efp-features
      '( efp-feature-python-mode ))

;; Now run initialize to let Emacs for Python do the rest.
(efp-initialize)