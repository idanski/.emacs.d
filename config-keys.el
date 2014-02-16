;;; config-keys.el --- key binding configuration
;;; Commentary:
;;; Code:

(require 'misc) ; needed for zap-up-to-char

(global-set-key (kbd "C-x r q") 'save-buffers-kill-emacs)
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "<home>") 'my/smart-beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<f5>") 'my/revert-buffer-no-confirmation)
(global-set-key (kbd "<f6>") 'ag-project-at-point)
(global-set-key (kbd "<f7>") 'previous-error)
(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<f9>") 'magit-status)
(global-set-key (kbd "<f11>") 'my/cleanup-buffer)
(global-set-key (kbd "S-<f11>") 'whitespace-cleanup)
(global-set-key (kbd "S-<f12>") (lambda () (interactive) (find-file user-init-file)))

(global-set-key (kbd "M-<return>") 'my/open-line-below)
(global-set-key (kbd "M-S-<return>") 'my/open-line-above)
(global-set-key (kbd "C-<delete>") 'kill-word)

(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'previous-buffer)

(global-set-key (kbd "C-n") (lambda (n) (interactive "p") (scroll-up n)))
(global-set-key (kbd "C-p") (lambda (n) (interactive "p") (scroll-down n)))
(global-set-key (kbd "M-n") (lambda (n) (interactive "p") (scroll-other-window n)))
(global-set-key (kbd "M-p") (lambda (n) (interactive "p") (scroll-other-window (- n))))

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-!") 'kill-this-buffer)
(global-set-key (kbd "C-M-!") 'my/kill-buffer-other-window)
(global-set-key (kbd "C-#") 'calculator)
(global-set-key (kbd "C-'") 'highlight-symbol-at-point)
(global-set-key (kbd "C-,") 'highlight-symbol-prev)
(global-set-key (kbd "C-.") 'highlight-symbol-next)
(global-set-key (kbd "M-s o") 'highlight-symbol-occur)

(global-set-key (kbd "C-x C-r") 'my/ido-recentf-open)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)
(global-set-key (kbd "C-c n") 'my/cleanup-buffer)
(global-set-key (kbd "C-c d") 'my/diff-current-buffer-with-file)
(global-set-key (kbd "C-c r") 'my/rotate-windows)
(global-set-key (kbd "C-c C-;") 'my/toggle-comment-line-or-region)
(global-set-key (kbd "M-s s") 'sort-lines)
(global-set-key (kbd "M-s M-s") 'sort-lines)
(global-set-key (kbd "M-s O") 'occur)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)
(global-set-key (kbd "C-%") 'my/filter-buffer)

(global-set-key (kbd "C-+") 'my/increment-number-at-point)
(global-set-key (kbd "C-M-+") 'my/decrement-number-at-point)
(global-set-key (kbd "C-#") 'copy-from-above-command)

(define-key isearch-mode-map (kbd "C-*") 'my/isearch-current-region-or-word)

(global-set-key [remap goto-line] 'my/goto-line-with-feedback)

(provide 'config-keys)
;;; config-keys.el ends here
