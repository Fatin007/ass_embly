.data
	x: .word 69
.text
	li $v0,1
	lw $a0, x
	syscall
	