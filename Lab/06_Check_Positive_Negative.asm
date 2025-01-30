.data
	msg: .asciiz "Enter a Number: "
	pos: .asciiz "Positive"
	neg: .asciiz "Negative"
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	bge $t0, $zero, Positive
	j Negative
	
	Positive:
		li $v0, 4
		la $a0, pos
		syscall	
		j Exit
	
	Negative:
		li $v0, 4
		la $a0, neg
		syscall
		j Exit
		
	Exit:
		li $v0, 10
		syscall
