;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))

;; inf-ruby
;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;; (autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
;; (eval-after-load 'ruby-mode
;;   '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings)
;;  )

(require 'ruby-block)
(defun ruby-mode-hook-ruby-block()
    (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-ruby-block)
(setq ruby-block-highlight-toggle 'overlay)

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(let ((rel (assq 'ruby-electric-mode minor-mode-map-alist)))
    (setq minor-mode-map-alist (append (delete rel minor-mode-map-alist) (list rel))))
(setq ruby-electric-expand-delimiters-list nil)
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\C-c\C-i" 'rct-complete-symbol)
  ;; (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-d" 'xmp)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;; (require 'anything-rcodetools)
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")
;; (define-key anything-map [(control ?;)] 'anything-execute-persistent-action)

