BEGIN { pointer = 50; zeros = 0 }

/^L/ {
	clicks = int(substr($1, 2))

	for (i = 1; i <= clicks; i++) {
		pointer--
		if (pointer == 0) zeros++
		if (pointer == -1) pointer = 99
	}
}

/^R/ {
	clicks = int(substr($1, 2))

	for (i = 1; i <= clicks; i++) {
		pointer++
		if (pointer == 100) pointer = 0
		if (pointer == 0) zeros++
	}
}

END { print zeros; }

