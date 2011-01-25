(setq term-setup-hook
    '(lambda ()
	(setq keyboard-translate-table "\C-@\C-a\C-b\C-c\C-d\C-e\C-f\C-g\C-?")
	(global-set-key "\M-h" 'help-for-help)))

(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(control home)] 'beginning-of-buffer)
(global-set-key [(control end)] 'end-of-buffer)
(global-set-key [(control shift d)] 'delete-region)
(define-key esc-map [right] 'kill-word)         ;; esc -> kill-word
(define-key esc-map [left] 'backward-kill-word) ;; esc <- backward-kill-word

(setq-default indent-tabs-mode nil)

;; use command
(setq ns-command-modifier (quote meta))
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
;; turn off menu bar
(menu-bar-mode -1)
(setq visible-bell t)
(column-number-mode 1)
(global-font-lock-mode 1)
(setq-default transient-mark-mode 1)

(show-paren-mode t)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(add-hook 'python-mode-hook
           (lambda ()
             (set (make-variable-buffer-local =
'beginning-of-defun-function)
                  'py-beginning-of-def-or-class)
             (setq outline-regexp "def\\|class ")))

(add-to-list 'auto-mode-alist '("\\.e\\'" . eiffel-mode))
(autoload 'eiffel-mode "eiffel" "Major mode for Eiffel programs" t)

(add-to-list 'auto-mode-alist '("\\.p\\'" . prolog-mode))
(autoload 'prolog-mode "prolog" "Major mode for Prolog programs" t)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(autoload 'php-mode "php-mode" "PHP Mode." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(autoload 'ruby-mode "ruby-mode" "Ruby Mode." t)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(load "~/.emacs.d/lib/haskell-site-file")
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;(load "gnuserv-compat")
;;(load-library "gnuserv")
;;(gnuserv-start)

(global-set-key "\C-y" 'yank)

(require 'iswitchb)
(iswitchb-mode 1)

(defun iswitchb-fc-read-buffer (prompt &optional default existing)
  (save-window-excursion (buffer-name (iswitchb))))
(defadvice read-buffer (around iswitchb-fc-read-buffer)
  (setq ad-return-value (iswitchb-fc-read-buffer prompt)))

(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

(require 'org-install)
