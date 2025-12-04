BEGIN {
	FS = ""
	rolls = 0
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
				if (nd < 4) rolls++
				#print "grid[" r "][" c "] = " nd ", " rolls
			}
		}
	}
	print rolls
}
