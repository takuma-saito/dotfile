
;; anything
(defvar org-directory "")
(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(require 'anything-complete)
(anything-read-string-mode 1)
;; (require 'anything-show-completion)
(global-set-key "\C-x\C-b" 'anything-filelist+)
(global-set-key "\M-y" 'anything-show-kill-ring)

;; ruby, depends on rcodetools in gem
;; (require 'anything)
;; (require 'anything-rcodetools)
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")
