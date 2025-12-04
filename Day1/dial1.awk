BEGIN { pointer = 50; zeros = 0 }

/^L/ {
	clicks = substr($1, 2)
	pointer = pointer - (clicks % 100)
	
	if (pointer < 0) {
		pointer = 100 + pointer 
	} 
	
	if (pointer == 0) {
		zeros++
	}
}

/^R/ {
	clicks = substr($1, 2)
	pointer = pointer + (clicks % 100)

	if (pointer > 99) {
		pointer = pointer - 100
	} 
	
	if (pointer == 0) {
		zeros++
	}
}

END { print zeros; }

