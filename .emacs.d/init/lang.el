;; markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.text" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; C style
(add-hook 'c-mode-common-hook
          '(lambda ()
            (c-set-style "bsd")
            ;; インデントを空白文字で行う
            (setq indent-tabs-mode nil)
            ;; インデントの変更
            (setq c-basic-offset 2)
            ))
;; C++ style
(add-hook 'c++-mode-hook
          '(lambda()
            (c-set-style "bsd")
            ;; インデントを空白文字で行う
            (setq indent-tabs-mode nil)
            ;; インデントの変更
            (setq c-basic-offset 2)))

;; coffee script
(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; graphviz dot
(require 'graphviz-dot-mode)
(autoload 'graphviz-dot-mode "graphviz-dot-mod" nil t)
(add-to-list 'auto-mode-alist '("\\.dot$" . graphviz-dot-mode))

;; shell script
(add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))

;; lua mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Smarty mode
(add-to-list 'auto-mode-alist (cons "\\.tpl\\'" 'smarty-mode))
(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)

;; erlang
(setq load-path
      (cons (let ((erllib (concat (getenv "ERLANG_HOME") "/lib/")))
              (concat erllib (file-name-completion "tools-" erllib) "emacs"))
            load-path))
(setq erlang-root-dir (getenv "ERLANG_HOME"))
(setq exec-path (cons (concat (getenv "ERLANG_HOME") "/bin") exec-path))
(require 'erlang-start)

;;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac$" . js2-mode))

;; css の設定
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)

;; apache 用の設定ファイル
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))


(require 'yaml-mode)
(add-hook 'yaml-mode-hook
          '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent))) 

;; j mode
;; (autoload 'j-mode "j-mode.el"  "Major mode for J." t)
;; (autoload 'j-shell "j-mode.el" "Run J from emacs." t)
;; (setq auto-mode-alist
;;       (cons '("\\.ij[rstp]" . j-mode) auto-mode-alist))
;; (setq j-path "/Applications/j701/bin/")
;; (setq j-command "jconsole")

;; R mode
;; R を起動する時に ess-site をロード
;; https://gist.github.com/abicky/2392967

;; 拡張子が r, R の場合に R-mode を起動
;; (add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))

;; R-mode を起動する時に ess-site をロード
;; (autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;; D mode
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

;; lisp indent
(put 'if 'lisp-indent-function 3)

;; Common Lisp indent
(require 'cl-indent)
(setq lisp-indent-function (function common-lisp-indent-function))
;; (require 'cl-indent-patches)

;; scss mode
(setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする

;; php mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; python mode
(add-hook 'python-mode-hook
          '(lambda()
            (setq indent-tabs-mode nil)
            (setq indent-level 4)
            (setq python-indent 4)))


