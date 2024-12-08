;; part one
(defvar file-contents
  (with-temp-buffer
    (insert-file-contents-literally "input.txt")
    (split-string (buffer-string) "")))

(setq climb (length (seq-filter (lambda (c) (string-match c "(")) chars)))
(setq descend (length (seq-filter (lambda (c) (string-match c ")")) chars)))

(print (concat "part one: " (number-to-string (- climb descend))))







