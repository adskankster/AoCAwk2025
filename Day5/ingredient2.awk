BEGIN { 
	FS = "-"
}

/^.+-.+$/ {
	range[$1] += 1
	range[$2] += -1
}


END {
	fresh = 0
	state = 0
	
	n = asorti(range, ordered, "cmp_num_idx")

	for (i = 1; i <= n; i++) {
		if (state == 0) {
			start = i
		}

		state += range[ordered[i]]

		if (state == 0 || i == n) {
			fresh += ((ordered[i] - ordered[start]) + 1)
		}
	}
	
	print "Fresh = " fresh	
}

function cmp_num_idx(i1, v1, i2, v2)
{
     return (i1 - i2)
}
