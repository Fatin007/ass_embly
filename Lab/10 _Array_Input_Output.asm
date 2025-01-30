.data
	p1: .asciiz "Enter number of elements: "
	p2: .asciiz "Enter a element: "
	space: .asciiz " "
	out: .asciiz "Array elements: "
	arr: .space 500
.text
main:
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0
	la $t2, arr
	
	Input:
		beq $t1, $t0, Output
		li $v0, 4
		la $a0, p2
		syscall
		
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j Input
		
	Output:
		li $v0, 4
		la $a0, p1
		syscall
		
		