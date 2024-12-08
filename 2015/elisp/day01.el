;; part one
(setq file-contents
  (with-temp-buffer
    (insert-file-contents-literally "input.txt")
    (split-string (buffer-string) "")))

(setq answer-to-part-one
      (seq-reduce
       (lambda (acc char)
	 (cond
	  ((string= char "(") (1+ acc))
	  ((string= char ")") (1- acc))
	  (t acc)))
       file-contents
       0))

(print (concat "part one: " (number-to-string answer-to-part-one)))

;; part two
(defun answer-to-part-two (l)
  (let ((result 0)
	(pos 0))
    (catch 'exit
      (dolist (i l)
	(when (< result 0)
	  (throw 'exit pos))
	(cond
	 ((string= i "(")
	  (setq pos (1+ pos))
	  (setq result (1+ result)))
	 ((string= i ")")
	  (setq pos (1+ pos))
	  (setq result (1- result)))
	 (t nil))))
    pos))

(print (concat "part two: " (number-to-string (answer-to-part-two file-contents))))


