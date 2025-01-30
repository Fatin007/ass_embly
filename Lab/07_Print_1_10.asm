.data
	nl: .asciiz "\n"
.text
	addi $t0, $zero, 1
	loop:
		beq $t0, 11, Exit
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, nl
		syscall
		
		addi $t0, $t0, 1
		j loop
	Exit:
		li $v0, 10
		syscall
