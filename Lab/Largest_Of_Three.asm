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
	print_str ("Enter A: ")
	input_int($t1)
	print_str ("Enter B: ")
	input_int($t2)
	print_str ("Enter C: ")
	input_int($t3)
	print_str("Largest Number = ")
	
	bge $t1, $t2, A_boro
	j B_boro
	A_boro:
		bge $t1, $t3, A_largest
		j C_largest
	B_boro:
		bge $t2, $t3, B_largest
		j C_largest
		
	A_largest:
		print_int($t1)
		done
	B_largest:
		print_int($t2)
		done
	C_largest:
		print_int($t3)
		done
