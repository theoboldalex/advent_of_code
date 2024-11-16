BEGIN { FS="[,:;]" }

{
    red = 1
    green = 1
    blue = 1

    for (i = 1; i <= NF; i++) {
        if ($i ~ /red/) {
            gsub(/[a-z]/, "", $i)
            if ($i+0 > red) {
                red = $i
            }
        }
        if ($i ~ /green/) {
            gsub(/[a-z]/, "", $i)
            if ($i+0 > green) {
                green = $i
            }
        }
        if ($i ~ /blue/) {
            gsub(/[a-z]/, "", $i)
            if ($i+0 > blue) {
                blue = $i
            }
        }
    }

    sumPowers += red * green * blue
}

END { print sumPowers }
