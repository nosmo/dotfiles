(require 'package)
  (package-initialize)

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

(setq require-final-newline t)

(show-paren-mode t)

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(setq auto-mode-alist (cons '("\\.yaml$" . yaml-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))
(add-hook 'python-mode-hook 'color-identifiers-mode)

(add-to-list 'auto-mode-alist '("\\.e\\'" . eiffel-mode))
(autoload 'eiffel-mode "eiffel" "Major mode for Eiffel programs" t)

(add-to-list 'auto-mode-alist '("\\.p\\'" . prolog-mode))
(autoload 'prolog-mode "prolog" "Major mode for Prolog programs" t)

(autoload 'php-mode "php-mode" "PHP Mode." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(autoload 'ruby-mode "ruby-mode" "Ruby Mode." t)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;;(load "~/.emacs.d/lib/haskell-site-file")
;;(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

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

(global-set-key "\C-y" 'yank)

(if (<= emacs-major-version 24)
    (progn ;
      (require 'iswitchb)
      (iswitchb-mode 1)
      (defun iswitchb-fc-read-buffer (prompt &optional default existing)
        (save-window-excursion (buffer-name (iswitchb))))
      (defadvice read-buffer (around iswitchb-fc-read-buffer)
        (setq ad-return-value (iswitchb-fc-read-buffer prompt)))
      )
)

(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

(require 'org-install)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(load-file "/Users/nosmo/.emacs.d/emacs-for-python/epy-init.el")

(setq skeleton-pair nil)


(require 'elpy)
(require 'jedi)
