
;; haskell の式をすぐに評価する
;; inferior-haskell-load-file(C-c C-l)

;; haskell mode
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
                ("\\.chs$"    . haskell-mode))))

;; haskell-mode
(autoload 'haskell-mode "haskell-mode")
;; (autoload 'haskell-cabal "haskell-cabal")
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
(setq haskell-program-name "/usr/local/bin/ghci")

(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.cabal/share/ghc-mod-4.1.3")
(autoload 'ghc-init "ghc")
;; (ghc-init)
(add-to-list 'ac-sources 'ac-source-ghc-mod)

(autoload 'haskell-mode "haskell-mode" "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode" "Major mode for editing literate Haskell scripts." t)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook (lambda () (local-set-key "\C-i" 'ghc-complete)))
(add-hook 'haskell-mode-hook (lambda () (local-set-key [backtab] 'haskell-indent-cycle)))
(add-hook 'haskell-mode-hook 'haskell-hook)
;; (add-hook 'haskell-mode-hook 'inferior-haskell-load-file)
(defadvice inferior-haskell-load-file (after change-focus-after-load)
  "Change focus to GHCi window after \\<haskell-mode-map>\\[inferior-haskell-load-file] command."
  (other-window 1))
(ad-activate 'inferior-haskell-load-file)
(defun haskell-hook ()
  ;; Use simple indentation.
  ;; (turn-on-haskell-indentation)
  (ghc-init)
  (turn-on-haskell-simple-indent)
  (local-set-key (kbd "C-c C-e") 'inferior-haskell-load-and-run)
  ;; (define-key haskell-mode-map [tab] 'haskell-indent-cycle)
  (define-key haskell-mode-map (kbd "<return>") 'haskell-simple-indent-newline-same-col)
  (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent))
