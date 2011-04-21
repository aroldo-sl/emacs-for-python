;;; efp.el --- Emacs for Python - a modular Python configuration

;; Copyright (C) 2011  pyCologne User Group

;; Author: pyCologne User Group
;; Keywords: languages, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To use this modulare Python configuration add
;;
;;   (require 'efp)
;;   (setq efp-features
;;         '( efp-python-mode
;;            efp-python-style))
;;   (efp-initialize)
;;
;; to your .emacs.el.
;;
;; Please see the project page at
;; https://github.com/pycologne/emacs-for-python for details.

;;; Code:

(defgroup efp nil
  "Emacs for Python."
  :prefix "efp-"
  :group 'languages)

(defcustom efp-python-mode 'pymode-pydist
  "The preferred Python mode. The built-in mode (python.el) is
distributed with Emacs. python-model.el is distributed with the Python
  distribution."
  :group 'efp
  :type '(choice
          (const :tag "Built-in (python.el)" pymode-builtin)
          (const :tag "Python distribution (python-mode.el)"
                 pymode-pydist)))

(defvar efp-features '()
  "List of features to be enabled.")


(defun efp-feature-python-mode ()
  "Activates python mode."
  (if (equal efp-python-mode 'pymode-pydist)
      ;; Load python-mode.el
      ;; http://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl
      (progn
        (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
        (setq interpreter-mode-alist (cons '("python" . python-mode)
                                           interpreter-mode-alist))
         (autoload 'python-mode "python-mode" "Python Mode." t)
        )
    ;; Builtin Python mode (python.el) is ready to go.
    ;; No setup is needed.
    ))


(defun efp-setup-load-path ()
  "Make sure that things in vendor directory are available."
  ;; TODO(andi): How to add our vendor directory to load-path w/o
  ;; hardcoding it?
  (add-to-list 'load-path "vendor")
)


(defun efp-initialize()
  "Initializes all configured features and options."
  (interactive)
  (progn
    (efp-setup-load-path)
    (mapcar 'funcall efp-features)))


(provide 'efp)
;;; efp.el ends here
