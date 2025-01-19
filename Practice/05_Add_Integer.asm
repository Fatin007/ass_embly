.data
	n1: .word 69
	n2: .word 96
.text
	lw $t0, n1
	lw $t1, n2
	
	add $t2, $t1, $t0
	
	li $v0, 1
	move $a0, $t2
	syscall