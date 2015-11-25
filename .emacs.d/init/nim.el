
;; you must install highlight indentation mode.
(defun hook-nim-indentation ()
  (highlight-indentation-mode)
  (setq highlight-indentation-offset 2)
  (set-face-background 'highlight-indentation-face "#444444")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))    

;; show indentation in nim
(eval-after-load 'nim-mode
  '(add-hook 'nim-mode-hook 'hook-nim-indentation))

