.data
	d: .double 69.6969
	zero: .double 0.0
.text
	ldc1 $f2, d
	ldc1 $f0, zero
	li $v0, 3
	add.d $f12, $f2, $f0
	syscall