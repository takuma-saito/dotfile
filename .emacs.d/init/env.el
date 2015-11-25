;; 文字エンコーディング設定
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; undo のリミットを増やす
(setq undo-limit 100000)
(setq undo-strong-limit 130000)

;; 全体のキーバインド
(global-set-key "\C-ci" 'comment-indent) ; C-c i をコメントインデントに
(global-set-key "\C-c\C-u" 'uncomment-region)  ; C-c u を範囲指定コメント解除に
(global-set-key "\C-cd" 'comment-dwim)    ; C-c d を範囲指定コメントに
(global-set-key "\C-cb" 'comment-box)   ; C-c b をコメントボックスに
;; (global-set-key "\C-c\C-r" 'comment-region) ; C-c r をコメント範囲に
(global-set-key "\C-ck" 'linum-mode) ; C-c k で行数を表示
(global-set-key "\C-ct" 'text-mode)
(global-set-key "\C-ca" 'asm-mode)
(global-set-key "\C-xi" 'indent-region)  ; インデントの設定
(global-set-key "\C-m" 'newline-and-indent) ; リターンで改行とインデント
(global-set-key "\C-l" 'newline)  ; 改行
(global-set-key "\M-k" 'kill-sentence)
(global-set-key "\M-b" 'backward-kill-sentence)
(global-set-key "\C-u" 'undo) ; undo
(global-set-key "\C-b" 'backward-list)
(global-set-key "\C-f" 'forward-list)

; default mode is text mode
(setq default-major-mode 'text-mode)    

; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t) 

; 補完機能を使う
(setq partial-completion-mode 1)

;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)

;; 最終行の自動改行挿入を off
(setq require-final-newline nil)
(setq mode-require-final-newline nil)

;; ツールバーの非表示
(if window-system (progn (tool-bar-mode nil)))

;; 画面分割のキーバインド設定
(setq windmove-wrap-around t)
(define-key global-map "\C-o" 'other-window)

;;タブ幅を 4 に設定
(setq default-tab-width 2)

;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; ~ # を作らない
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

;; C-c c で compile コマンドを呼び出す
;; (define-key mode-specific-map "c" 'compile)

; 対応する括弧を光らせる。
(show-paren-mode t) 

; 選択部分のハイライト
(transient-mark-mode t)

;; remove vc-git hook
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; syntax colors
(global-font-lock-mode t)

;; hide menu bar
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; 画像ファイルを表示する
(auto-image-file-mode t)

;; タブでインデントさせる
(setq tab-always-indent 'complete)

;; 問い合わせを簡略化
(fset 'yes-or-no-p 'y-or-n-p)

(when (require 'recentf nil t)
    (setq recentf-max-saved-items 2000)
    (setq recentf-exclude '(".recentf"))
    (setq recentf-auto-cleanup 10)
    (setq recentf-auto-save-timer
          (run-with-idle-timer 600 t 'recentf-save-list))
    (recentf-mode 1))

(require 'server)
(unless (server-running-p)
    (server-start))

