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
	
.macro done
	li $v0, 10
	syscall
	.end_macro
	
.text
	li $t0, 0  # N
	li $t1, 1  # i
	li $t2, 0  #sum
	
	loop:
		bgt $t1, 21, break

		add $t2, $t2, $t1
		addi $t0, $t0, 1
		addi $t1, $t1, 2
		j loop
		
	break:
		div $t2, $t0
		mflo $s0
		print_str("Average = ")
		print_int($s0) 
		done
