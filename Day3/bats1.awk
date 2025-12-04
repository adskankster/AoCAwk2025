BEGIN { 
	FS = "" 
	power = 0
}

/^.+$/ {
	largel = 0
	larger = 0

	start = 0

	
	for (b = 1; b < NF; b++) {
		if (largel < $b) {
			largel = $b
			start = b + 1
		}
	}

	for (b = start; b <= NF; b++) {
		if (larger < $b) larger = $b
	}

	power += int(largel larger)
}

END { print power }
