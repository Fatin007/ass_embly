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

.text
	print_str ("Enter a number: ")
	input_int($t1)
	li $t0, 2
	
	beq $t1, 1, Not_Prime
	beqz $t1, Not_Prime
	
	loop:
		beq $t0, $t1, Prime
		
		div $t1, $t0
		mfhi $t2
		beqz $t2, Not_Prime
		
		addi $t0, $t0, 1
		j loop
	Prime:
		print_int($t1)
		print_str(" is Prime")
		done
		
	Not_Prime:
		print_int($t1)
		print_str(" is Not Prime")
		done
		
