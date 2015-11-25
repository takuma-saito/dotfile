(require 'go-mode)
(add-hook 'go-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq indent-tabs-mode 1)))
