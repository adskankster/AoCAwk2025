BEGIN { 
	FS = "" 
	power = 0
}

/^.+$/ {
	start = 1
	
	for (i = 1; i <=12; i++) {
		for (b = start; b <= (NF - (12 - (i))); b++) {
			if (large[i] < $b) {
				large[i] = $b
				start = b + 1

			}
		}
		#print "value = " large[i] ", b = " b ", calc=" (NF - (13 - start))  ", start = " start ", i = " i
	}

	tmp = int(large[1] large[2] large[3] large[4] large[5] large[6] large[7] large[8] large[9] large[10] large[11] large[12])
	power += tmp
	print tmp
	delete large
}

END { print power }
