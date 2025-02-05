.data
	comma: .asciiz ", "
	full_stop: .asciiz "."
.text
	addi $t0, $zero, 1
	loop:
		li $v0, 1
		move $a0, $t0
		syscall
		
		addi $t0, $t0, 1
		beq $t0, 11, Exit
		
		li $v0, 4
		la $a0, comma
		syscall
		
		j loop
	Exit:
		li $v0, 4
		la $a0, full_stop
		syscall
		
		li $v0, 10
		syscall
