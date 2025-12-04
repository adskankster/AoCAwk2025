BEGIN { FS = ","; invalid = 0 }

/^.+$/ {
	for (f = 1; f <= NF; f++) {
		split($f, range, "-")
		lower = int(range[1])
		upper = int(range[2])

		for (i = lower; i <= upper; i++) {
			l = length(i)

			if (l % 2 == 1) continue

			sp = l / 2
			first = substr(i, 1, sp)
			second = substr(i, sp+ 1) 
			
			if (first == second) invalid += i
		}
	}

	print invalid
}
