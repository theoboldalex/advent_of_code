(require '[clojure.string :as str])

(def test-input "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet")

(def real-input (slurp "day1.txt"))

(defn get-part-1-answer [s]
  (reduce + (->>
             s
             (str/split-lines)
             (map #(str/replace % #"[^0-9]" ""))
             (map #(str (first %) (last %)))
             (map #(Integer/parseInt %)))))

(get-part-1-answer real-input)
