;; part one
(setq file-contents
  (with-temp-buffer
    (insert-file-contents-literally "input.txt")
    (split-string (buffer-string) "")))

;; first approach
;;(setq climb (length (seq-filter (lambda (c) (string-match c "(")) file-contents)))
;;(setq descend (length (seq-filter (lambda (c) (string-match c ")")) file-contents)))
;;(print (concat "part one: " (number-to-string (- climb descend))))

;; better approach
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






