;;; config-misc.el --- misc configuration
;;; Commentary:
;;; Code:

;; frame title
(setq frame-title-format
      '("" invocation-name ": " (:eval (if buffer-file-name (abbreviate-file-name buffer-file-name) "%b"))))

;; mode-line
(setq-default
 mode-line-format
 (list
  " "
  ;; the buffer name; the file name as a tool tip
  '(:eval (propertize "%b" 'face '(font-lock-keyword-face bold) 'help-echo (buffer-file-name)))
  " "
  ;; was this buffer modified since the last save?
  '(:eval (when (buffer-modified-p) (propertize "[*] " 'face 'font-lock-warning-face 'help-echo "Buffer has been modified")))
  ;; line and column
  "(" ;; '%02' to set to 2 chars at least; prevents flickering
  (propertize "%l" 'face 'font-lock-type-face) "," (propertize "%c" 'face 'font-lock-type-face)
  ") "
  ;; relative position, size of file
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "/"
  '(:eval (propertize (concat (int-to-string (count-lines (point-min) (point-max))) "L") 'face 'font-lock-constant-face)) ;; line num
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] "
  ;; encoding and eol-type
  "["
  '(:eval (concat
           (propertize (upcase (symbol-name (coding-system-get buffer-file-coding-system :mime-charset))) 'face 'font-lock-comment-face
                       'help-echo (coding-system-doc-string buffer-file-coding-system))
           "|"
           (propertize
            (case (coding-system-eol-type buffer-file-coding-system)
              (0 "UNIX")
              (1 "DOS")
              (2 "MAC")
              (t "NIL"))
            'face 'font-lock-comment-face)))
  "] "
  ;; is this buffer in overwrite-mode?
  '(:eval (when overwrite-mode
            (concat "["
                    (propertize "Ovr" 'face 'font-lock-preprocessor-face 'help-echo "Buffer is in overwrite mode")
                    "] ")))
  ;; is this buffer read-only?
  '(:eval (when buffer-read-only
            (concat "["
                    (propertize "RO" 'face 'font-lock-type-face 'help-echo "Buffer is read-only")
                    "] ")))
  ;; the current major mode for the buffer.
  "{"
  (propertize "%m" 'face 'font-lock-function-name-face 'help-echo buffer-file-coding-system)
  ;; i don't want to see minor-modes; but if you want, uncomment this:
  ;; minor-mode-alist  ;; list of minor modes
  (propertize "%n" 'face 'font-lock-type-face)
  "} "
  ;; justify right by filling with spaces to right fringe
  (propertize " " 'display '((space :align-to (- right 4))))
  ;; add the time, with the date and the emacs uptime in the tooltip
  '(:eval (propertize (format-time-string "%H:%M") 'face 'bold
                      'help-echo (concat (format-time-string "%c; ") "Uptime: " (emacs-uptime "%D, %z%2h:%.2m"))))
  ))

;; misc configuration
(prefer-coding-system 'utf-8)
(modify-coding-system-alist 'file "" 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)
(mouse-avoidance-mode 'banish)
(windmove-default-keybindings 'super)   ; enable windmove
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      ring-bell-function 'ignore
      resize-mini-windows t)
(setq disabled-command-function nil)    ; enable all disabled commands

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(when (eq system-type 'windows-nt)
  (setq tramp-default-method "plinkx")
  (windmove-default-keybindings 'meta))

(provide 'config-misc)
;;; config-misc.el ends here
