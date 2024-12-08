;; part one
(defun get-face-dimensions (l)
  (list
    (seq-subseq l 0 2)
    (seq-subseq l 1 3)
    (list (car (last l)) (seq-first l))))

(defun calc-area-of-face (l)
  (* (car l) (car (last l))))

(setq present-dimensions
      (seq-map
       (lambda (i)
	 (seq-map 'string-to-number (split-string i "x")))
       (with-temp-buffer
	 (insert-file-contents-literally "input.txt")
	 (split-string (string-trim (buffer-string)) "\n"))))

(setq area-of-faces 
      (seq-map
       (lambda (i)
	 (seq-map 'calc-area-of-face i))
       (seq-map 'get-face-dimensions present-dimensions)))

(setq paper-required-for-present
      (seq-map
       (lambda (i)
	 (list
	  (* 2 (seq-reduce '+ i 0))
	  (seq-min i)))
       area-of-faces))

(setq total-paper-required
      (seq-reduce
       '+
       (seq-map
	(lambda (i)
	  (seq-reduce '+ i 0))
	paper-required-for-present)
       0))

(print (concat "part one: " (number-to-string total-paper-required)))
