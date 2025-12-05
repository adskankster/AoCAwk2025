BEGIN { 
	FS = "-"
	range[0][0] = 0
	fresh = 0
	multi = 1
}

/^.+$/ {
	if (multi == 1) {
		range[0][0] += 1
		range[NR][1] = $1
		range[NR][2] = $2
	}

	if (multi == 0) {
		for (i = 1; i <= range[0][0]; i++) {
			if ($1 >= range[i][1] && $1 <= range[i][2]) {
				fresh++
				break
			}
		}
	}
}

$0 == "" { multi = 0 }

END { print fresh }

