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
	
	while:
		beq $t1, $t0, break
		li $v0, 4
		la $a0, p2
		syscall
		
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j while
		
	break:
		li $v0, 4
		la $a0, out
		syscall
		
		li $t1, 0
		la $t2, arr
		
		li $t4, 0
 	
	Out_loop:
		beq $t1, $t0, Exit
		
		lw $t5, 0($t2)
		
		bge $t5, $t4, peye_gechi
		j pai_nai
		
		peye_gechi:
			addi $t4, $t5, 0
			j continue
		pai_nai:
			j continue
			
		continue:
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j Out_loop
	Exit:
		li $v0, 5
		move $a0, $t4
		syscall
		
		li $v0,10
		syscall
		
		
		
