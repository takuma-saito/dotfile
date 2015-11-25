
;; `M-x slime`: slime を起動
;; `C-c S`: goshのインタープリタが起動
;; `C-c C-l`: インタープリタにファイルをロード
;; `C-x C-e`: 式を評価(ex. (+ 2 3)の直後にカーソルを合わせてC-x C-eするとインタープリタに5が表示)
;; `C-x o`: 次のウィンドウへ

;; ? なんだこれ ？
;; Common Lispの設定
;; (load (expand-file-name "~/.lisp/slime-helper.el"))

(setq scheme-program-name "/usr/local/bin/gosh -i -I.")

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun run-scm ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))


(setq inferior-lisp-program "/usr/local/bin/sbcl")     ; sbcl用
;; (setq inferior-lisp-program "/usr/local/bin/clisp")    ; clisp用
(add-hook 'lisp-mode-hook
          (lambda ()
            (slime-mode t)
            (define-key lisp-mode-map (kbd "C-c C-s") 'slime)
            (add-to-list 'ac-sources 'ac-source-slime)
            ))
(add-hook 'comint-mode-hook
          (lambda ()
            (slime-mode t)
            (auto-complete-mode t)
            ))
(setq slime-contribs '(slime-repl slime-fancy slime-banner))

;; (autoload 'gauche-mode "gauche-mode" nil t)
;; (setq auto-mode-alist (cons '("\\.scm$" . gauche-mode) auto-mode-alist))


;; (require 'slime-autoloads)
;; (slime-setup '(slime-repl))

;; ;; gauche

;; (setq scheme-program-name "gosh -I.")
;; ;; (setq scheme-program-name "sbcl")
;; (require 'cmuscheme)

;; ;; 正常に動かない
;; ;; (defun scheme-other-window ()
;; ;;     "Run scheme on other window"
;; ;;       (interactive)
;; ;;       (switch-to-buffer-other-window
;; ;;             (get-buffer-create "*scheme*"))
;; ;;           (run-scheme scheme-program-name))
;; ;; (define-key scheme-mode-map
;; ;;     "\C-cS" 'scheme-other-window)

;; (define-key slime-mode-map
;;     "\C-c\C-e" 'slime-eval-last-expression-in-repl)

;; (setq slime-net-coding-system 'utf-8-unix)

;; (require 'popwin)
;; ;; popwin
;; ;; Apropos
;; (push '("*slime-apropos*") popwin:special-display-config)
;; ;; Macroexpand
;; (push '("*slime-macroexpansion*") popwin:special-display-config)
;; ;; Help
;; (push '("*slime-description*") popwin:special-display-config)
;; ;; Compilation
;; (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; ;; Cross-reference
;; (push '("*slime-xref*") popwin:special-display-config)
;; ;; Debugger
;; (push '(sldb-mode :stick t) popwin:special-display-config)
;; ;; REPL
;; (push '(slime-repl-mode) popwin:special-display-config)
;; ;; Connections
;; (push '(slime-connection-list-mode) popwin:special-display-config)

;; (require 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

;; ;; set indentation
;; (put 'and-let* 'scheme-indent-function 1)
;; (put 'begin0 'scheme-indent-function 0)
;; (put 'call-with-client-socket 'scheme-indent-function 1)
;; (put 'call-with-input-conversion 'scheme-indent-function 1)
;; (put 'call-with-input-file 'scheme-indent-function 1)
;; (put 'call-with-input-process 'scheme-indent-function 1)
;; (put 'call-with-input-string 'scheme-indent-function 1)
;; (put 'call-with-iterator 'scheme-indent-function 1)
;; (put 'call-with-output-conversion 'scheme-indent-function 1)
;; (put 'call-with-output-file 'scheme-indent-function 1)
;; (put 'call-with-output-string 'scheme-indent-function 0)
;; (put 'call-with-temporary-file 'scheme-indent-function 1)
;; (put 'call-with-values 'scheme-indent-function 1)
;; (put 'dolist 'scheme-indent-function 1)
;; (put 'dotimes 'scheme-indent-function 1)
;; (put 'if-match 'scheme-indent-function 2)
;; (put 'let*-values 'scheme-indent-function 1)
;; (put 'let-args 'scheme-indent-function 2)
;; (put 'let-keywords* 'scheme-indent-function 2)
;; (put 'let-match 'scheme-indent-function 2)
;; (put 'let-optionals* 'scheme-indent-function 2)
;; (put 'let-syntax 'scheme-indent-function 1)
;; (put 'let-values 'scheme-indent-function 1)
;; (put 'let/cc 'scheme-indent-function 1)
;; (put 'let1 'scheme-indent-function 2)
;; (put 'letrec-syntax 'scheme-indent-function 1)
;; (put 'make 'scheme-indent-function 1)
;; (put 'match 'scheme-indent-function 1)
;; (put 'match-lambda 'scheme-indent-function 1)
;; (put 'match-let 'scheme-indent-fucntion 1)
;; (put 'match-let* 'scheme-indent-fucntion 1)
;; (put 'match-letrec 'scheme-indent-fucntion 1)
;; (put 'match-let1 'scheme-indent-function 2)
;; (put 'match-define 'scheme-indent-fucntion 1)
;; (put 'multiple-value-bind 'scheme-indent-function 2)
;; (put 'parameterize 'scheme-indent-function 1)
;; (put 'parse-options 'scheme-indent-function 1)
;; (put 'receive 'scheme-indent-function 2)
;; (put 'rxmatch-case 'scheme-indent-function 1)
;; (put 'rxmatch-cond 'scheme-indent-function 0)
;; (put 'rxmatch-if  'scheme-indent-function 2)
;; (put 'rxmatch-let 'scheme-indent-function 2)
;; (put 'syntax-rules 'scheme-indent-function 1)
;; (put 'unless 'scheme-indent-function 1)
;; (put 'until 'scheme-indent-function 1)
;; (put 'when 'scheme-indent-function 1)
;; (put 'while 'scheme-indent-function 1)
;; (put 'with-builder 'scheme-indent-function 1)
;; (put 'with-error-handler 'scheme-indent-function 0)
;; (put 'with-error-to-port 'scheme-indent-function 1)
;; (put 'with-input-conversion 'scheme-indent-function 1)
;; (put 'with-input-from-port 'scheme-indent-function 1)
;; (put 'with-input-from-process 'scheme-indent-function 1)
;; (put 'with-input-from-string 'scheme-indent-function 1)
;; (put 'with-iterator 'scheme-indent-function 1)
;; (put 'with-module 'scheme-indent-function 1)
;; (put 'with-output-conversion 'scheme-indent-function 1)
;; (put 'with-output-to-port 'scheme-indent-function 1)
;; (put 'with-output-to-process 'scheme-indent-function 1)
;; (put 'with-output-to-string 'scheme-indent-function 1)
;; (put 'with-port-locking 'scheme-indent-function 1)
;; (put 'with-string-io 'scheme-indent-function 1)
;; (put 'with-time-counter 'scheme-indent-function 1)
;; (put 'with-signal-handlers 'scheme-indent-function 1)

