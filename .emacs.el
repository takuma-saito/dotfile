;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsの設定ファイル ;;
;;;;;;;;;;;;;;;;;;;;;;;;;


;; TODO
;; * 起動時間の短縮（min-loader にベンチマーク, エラーハンドラーを入れる）

;; ロードパスの設定
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/public")
        (expand-file-name "~/.emacs.d/private"))
       load-path))

(require 'min-loader)
(set-loader-path "~/.emacs.d/init")
(min-loads
 (list
  ;; あってもなくてもよい
  ;; "ku-proxy.el"
  "func.el"

  ;; 重要
  "env.el"
  "tools.el"
  "helm.el"
  
  ;; 言語系
  "lang.el"
  "ruby.el"
  "lisp.el"
  ;;"haskell.el"
  ;; "go.el"
  ;;"yatex.el"
  "rust.el"
  "nim.el"
  "web-mode.el"
  "scala.el"
  ;; "gnuplot.el"
  ;; "nim.el"
  ;;"omake.el"
  ;;"fortran.el"
  
  ;; "multi-web-mode.el"
  ))

