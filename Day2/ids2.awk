BEGIN { FS = ","; invalid = 0 }

/^.+$/ {
	for (f = 1; f <= NF; f++) {
		split($f, range, "-")
		lower = int(range[1])
		upper = int(range[2])

		for (i = lower; i <= upper; i++) {
			l = length(i)

			if (l % 2 == 0) {
				sp = l / 2
				first = substr(i, 1, sp)
				second = substr(i, sp+ 1) 
				
				if (first == second) {
					invalid += i
					continue
				}
			} 

			if(i % 3 == 0) {
				sp = l / 3
				first = substr(i, 1, sp)
				second = substr(i, sp + 1, sp) 
				third = substr(i, (2 * sp) + 1p) 
				
				if (first == second && first == third) {
					invalid += i
					continue
				}
			} 

			if (l % 5 == 0) {
				sp = l / 5
				first = substr(i, 1, sp)
				second = substr(i, sp + 1, sp) 
				third = substr(i, (2 * sp) + 1, sp) 
				fourth = substr(i, (3 * sp) + 1, sp) 
				fifth = substr(i, (4 * sp) + 1) 
				
				if (first == second && first == third && first == fourth && first == fifth) {
					invalid += i
					continue
				}

			} 

			if (l % 7 == 0) {
				sp = l / 7
				first = substr(i, 1, sp)
				second = substr(i, sp + 1, sp) 
				third = substr(i, (2 * sp) + 1, sp) 
				fourth = substr(i, (3 * sp) + 1, sp) 
				fifth = substr(i, (4 * sp) + 1, sp) 
				sixth = substr(i, (5 * sp) + 1, sp) 
				seventh = substr(i, (6 * sp) + 1) 
				
				if (first == second && first == third && first == fourth && first == fifth && first == sixth && first == seventh) {
					invalid += i
					continue
				}
			}
		}
	}

	print invalid
}
