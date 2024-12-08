;; part one
(setq file-contents
  (with-temp-buffer
    (insert-file-contents-literally "input.txt")
    (split-string (buffer-string) "")))

(setq climb (length (seq-filter (lambda (c) (string-match c "(")) file-contents)))
(setq descend (length (seq-filter (lambda (c) (string-match c ")")) file-contents)))

(print (concat "part one: " (number-to-string (- climb descend))))

;; part two






