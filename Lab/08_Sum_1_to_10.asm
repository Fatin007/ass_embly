.data
	msg: .asciiz "Sum: "
.text
	li $t0, 1 # Counter
	li $t1, 0 # Sum
	loop:
		beq $t0, 11, Exit
		
		add $t1, $t1, $t0
		
		addi $t0, $t0, 1
		j loop
	Exit:
		li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall
