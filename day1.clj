(require '[clojure.string :as str])

(def test-input "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet")

;;;;;;;;;;;;
;; PART 1 ;;
;;;;;;;;;;;;

(def real-input (slurp "day1.txt"))

(defn get-value-for-line [s]
  (->> s
       (map #(str/replace % #"[^0-9]" ""))
       (map #(str (first %) (last %)))
       (map #(Integer/parseInt %))))

(defn get-part-1-answer [s]
  (reduce + (->>
             s
             (str/split-lines)
             (get-value-for-line))))

(get-part-1-answer real-input)

;;;;;;;;;;;;
;; PART 2 ;;
;;;;;;;;;;;;

(def test-part-2 "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen")

(def word-to-num {:one 1
                  :two 2
                  :three 3
                  :four 4
                  :five 5
                  :six 6
                  :seven 7
                  :eight 8
                  :nine 9})

(def merged-words-to-num {:oneight 18
                          :twone 21
                          :threeight 38
                          :fiveight 58
                          :sevenine 79
                          :eightwo 82
                          :eighthree 83
                          :nineight 98
                          })

(defn replace-word-with-map-value [s m]
  (str/replace s
               (re-pattern (str/join "|" (map name (keys m))))
               #(str (get m (keyword %)))))

(defn get-part-2-answer [s]
  (reduce + (->>
             s
             (str/split-lines)
             (map #(replace-word-with-map-value % merged-words-to-num))
             (map #(replace-word-with-map-value % word-to-num))
             (get-value-for-line))))

(get-part-2-answer real-input)
