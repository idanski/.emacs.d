;;; config-custom.el --- custom configuration -*- lexical-binding: t; byte-compile-warnings: (not unresolved) -*-
;;; Commentary:
;;; Code:
(require 'seq)

(defgroup my/customizations nil
  "Customizations"
  :group 'convenience)

(defcustom my/theme 'doom-one
  "Emacs theme."
  :type 'symbol
  :group 'my/customizations)

(defcustom my/font-family (seq-find (lambda (font) (find-font (font-spec :name font)))
                                    '("Iosevka SS05" "Iosevka SS09" "Iosevka SS01" "Iosevka" "Ubuntu Mono"))
  "Emacs font family."
  :type 'string
  :group 'my/customizations)

(defcustom my/font-height (if (eq system-type 'darwin) 150 120)
  "Emacs font height."
  :type 'integer
  :group 'my/customizations)

(defcustom my/windmove-modifier "M"
  "Modifier key used for windmove bindings."
  :type 'string
  :group 'my/customizations)

(defcustom my/format-on-save nil
  "Format the buffer when saving."
  :type 'boolean
  :safe #'booleanp
  :group 'my/customizations)

(defcustom my/emails ()
  "A list of email addresses associated with you."
  :type '(repeat string)
  :group 'my/customizations)

(provide 'config-custom)

;;; config-custom.el ends here
