
;; (eval-when-compile (require 'cl))

(require 'helm-config)

(global-set-key "\C-x\C-b" 'helm-for-files)
(global-set-key "\C-x\C-r" 'helm-recentf)
(global-set-key "\C-x\C-g" 'helm-do-grep)

