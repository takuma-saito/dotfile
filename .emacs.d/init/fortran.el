
;; Fortranモードの設定(固定形式)
(setq fortran-mode-hook
      '(lambda () 
         (setq
          fortran-do-indent 2
          fortran-if-indent 2
          fortran-program-indent 2
          fortran-continuation-indent 2
          )))

;; Fortranモードの設定(自由形式)
(setq f90-mode-hook
      '(lambda () 
         (setq
          f90-do-indent 2
          f90-if-indent 2
          f90-program-indent 2
          f90-continuation-indent 2
          )))

(add-hook 'f90-mode-hook
          '(lambda ()
             (define-key f90-mode-map "\C-m" 'newline-and-indent)))
