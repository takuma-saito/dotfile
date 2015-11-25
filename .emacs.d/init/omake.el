
(require 'omake-mode)
(add-to-list 'auto-mode-alist '("OMakefile"   . omake-mode))
(setq omake-program-path "$HOME/.opam/4.00.1/bin/omake") ; The path of omake
(setq omake-program-arguments "-P -w -j 1 --verbose") ; Options
(setq omake-error-highlight-background "#555500")
(global-unset-key "\M-P")
(global-unset-key "\M-N")
(global-unset-key "\M-o")
(global-unset-key "\C-co")
(global-unset-key "\C-cO")
(global-set-key "\M-P" 'omake-previous-error)
(global-set-key "\M-N" 'omake-next-error)
(global-set-key "\M-o" 'omake-round-visit-buffer)
(global-set-key "\C-co" 'omake-run)
(global-set-key "\C-cO" 'omake-rerun)

