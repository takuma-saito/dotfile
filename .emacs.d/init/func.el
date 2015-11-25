
(defun eval-and-replace ()
    "Replace the preceding sexp with its value."
      (interactive)
        (backward-kill-sexp)
          (condition-case nil
                    (prin1 (eval (read (current-kill 0)))
                                        (current-buffer))
                (error (message "Invalid expression")
                                  (insert (current-kill 0)))))

;; (global-set-key "\C-c\C-e" 'eval-and-replace)

(defun reload-emacs ()
  "reload my .emacs.el file"
  (interactive)
  (load-file "~/.emacs.el")
  )

(defun lines ()
    (1+ (count-lines 1 (point))))

(defun string-join (list sep)
  (if (null (cdr list)) (car list)
    (format "%s%s%s" (car list) sep (string-join (cdr list) sep))))

(defun sep-by-char (list)
  (mapcar 'char-to-string (string-to-list list)))

(defun iota (num)
  (defun iota-inner (num result)
    (if (= 0 num) result
      (let ((i (- num 1)))
        (iota-inner i (cons i result)))))
  (reverse (iota-inner num nil)))


