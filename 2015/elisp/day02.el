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

;; part two
(defun ribbon-for-bow (present)
  (seq-reduce '* present 1))

(defun remove-max-dimension (present)
  (let ((sorted (sort present '<)))
    (list (car sorted) (cadr sorted))))

(defun ribbon-for-present (present)
  (* 2 (seq-reduce '+ 
		   (remove-max-dimension present) 0)))

(setq ribbon-for-presents
      (seq-map
       (lambda (i)
	 (* 2 (seq-reduce '+ i 0)))
       (seq-map
	'remove-max-dimension
	present-dimensions)))

(setq total-ribbon-required
      (seq-reduce
       '+
       (seq-map
	(lambda (i)
	  (+ (ribbon-for-bow i) (ribbon-for-present i)))
	present-dimensions)
       0))

(print (concat "part two: " (number-to-string total-ribbon-required)))
