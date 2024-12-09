(setq input
      (with-temp-buffer
	(insert-file-contents-literally "input.txt")
	(string-trim (buffer-string))))

;; part one
(setq coords-visited (list (list 0 0))) ;; initial setup here so in scope for functions

(defun build-path (str)
  ;; this is janky af. must be a more idiomatic way
  (setq coords-visited (list (list 0 0))) ;; reset here otherwise answer only correct first time run interactively
  (seq-map
   'set-current-coords
   str))

(defun set-current-coords (char)
  (let ((previous-coords (seq-first coords-visited)))
    (cond
     ((string= (char-to-string char) "^")
      (push
       (list (seq-first previous-coords) (1+ (car (last previous-coords))))
       coords-visited))
     ((string= (char-to-string char) "v")
      (push
       (list (seq-first previous-coords) (1- (car (last previous-coords))))
       coords-visited))
     ((string= (char-to-string char) ">")
      (push
       (list (1+ (seq-first previous-coords)) (car (last previous-coords)))
       coords-visited))
     ((string= (char-to-string char) "<")
      (push
       (list (1- (seq-first previous-coords)) (car (last previous-coords)))
       coords-visited))
     (t nil))))

(print
 (concat
  "part one: "
  (number-to-string
   (length
    (delete-dups
     (car (last (build-path input))))))))
