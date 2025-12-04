BEGIN {
	FS = ""
	rolls = 0
	old_rolls = -1
	total_rolls = 0
	grid[0][0] = 0
}

/^.+$/ {
	grid[0][0] += 1
	grid[NR][0] = 0

	for (i = 1; i <= NF; i++) {
		grid[NR][i] = $i
		grid[NR][0] += 1
	}
}

END {
	do {
		old_rolls = rolls

		for (r = 1; r <= grid[0][0]; r++) {
			for (c = 1; c <= grid[r][0]; c++) {
				if (grid[r][c] == "@") {
					nd = 0
					if (grid[r - 1][c] == "@") nd++
					if (grid[r - 1][c - 1] == "@") nd++
					if (grid[r - 1][c + 1] == "@") nd++
					if (grid[r + 1][c] == "@") nd++
					if (grid[r + 1][c - 1] == "@") nd++
					if (grid[r + 1][c + 1] == "@") nd++
					if (grid[r][c + 1] == "@") nd++
					if (grid[r][c - 1] == "@") nd++
					if (nd < 4) {
						grid[r][c] = "."
						rolls++
					}
					#print "grid[" r "][" c "] = " nd ", " rolls
				}
			}
		}

		total_rolls += rolls

	} while (rolls != old_rolls)
	print rolls
}
