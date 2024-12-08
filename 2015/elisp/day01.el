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






