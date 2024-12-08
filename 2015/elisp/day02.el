;; part one
(defun dimensions-to-list (d)
  (seq-map 'string-to-number (split-string d "x")))

(setq present-dimensions
      (seq-map
       'dimensions-to-list
       (with-temp-buffer
	 (insert-file-contents-literally "input.txt")
	 (split-string (string-trim (buffer-string)) "\n"))))

(defun get-faces (l)
  (list
    (seq-subseq l 0 2)
    (seq-subseq l 1 3)
    (list (car (last l)) (seq-first l))))

(defun calc-area-of-face (l)
  (* (car l) (car (last l))))

(setq area-of-faces 
      (seq-map
       (lambda (i)
	 (seq-map 'calc-area-of-face i))
       (seq-map 'get-faces present-dimensions)))

(setq present-paper
      (seq-map
       (lambda (i)
	 (list
	  (* 2 (seq-reduce '+ i 0))
	  (seq-min i)))
       area-of-faces))

(setq part-one-answer
      (seq-reduce '+
       (seq-map
	(lambda (i)
	  (seq-reduce '+ i 0))
	present-paper)
       0))

(print (concat "part one: " (number-to-string part-one-answer)))
