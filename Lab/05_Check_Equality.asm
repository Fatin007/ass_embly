.data
	msg1: .asciiz "Enter First Number: "
	msg2: .asciiz "Enter Second Number: "
	eq: .asciiz "Equal"
	neq: .asciiz "Not Equal"
.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	beq $t0, $t1, Equal
	j Not_Equal
	
	Equal:
		li $v0, 4
		la $a0, eq
		syscall	
		j Exit
	
	Not_Equal:
		li $v0, 4
		la $a0, neq
		syscall
		j Exit
		
	Exit:
		li $v0, 10
		syscall
