.macro print_str (%str)
.data
	myLabel: .asciiz %str
.text
	li $v0, 4
	la $a0, myLabel
	syscall
	.end_macro

.macro print_int (%x)
	li $v0, 1
	move $a0, %x
	syscall
	.end_macro

.macro input_int (%x)
	li $v0, 5
	syscall
	move %x,$v0
	.end_macro

.macro done
	li $v0, 10
	syscall
	.end_macro

.data
	arr: .space 500
.text
main:
	print_str("Enter number of elements: ")
	input_int($t0)
	
	li $t1, 0
	la $t2, arr
	
	In_loop:
		beq $t1, $t0, Output
		print_str("Enter an element: ")
		input_int($s0)
		sw $s0, 0($t2)
		
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j In_loop
		
	Output:
		print_str("Max element: ")
		
		li $t1, 0
		la $t2, arr
		li $t3, 0
 	
	Out_loop:
		beq $t1, $t0, Exit
		
		lw $s0, 0($t2)
		
		bgt $s0, $t3, boro_paisi
		j continue
		
		boro_paisi:
			addi $t3, $s0, 0
			j continue
		continue:
		
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j Out_loop
	Exit:
		print_int($t3)
		done
		
		
		
