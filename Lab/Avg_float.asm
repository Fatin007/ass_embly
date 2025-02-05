.macro print_str (%str)
.data
	myLabel: .asciiz %str
.text
	li $v0, 4
	la $a0, myLabel
	syscall
	.end_macro
	
.macro print_float (%x)
	li $v0, 2
	mov.s $f12, %x
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
		mtc1 $t2, $f1
		mtc1 $t0, $f2
		
		cvt.s.w $f1, $f1
		cvt.s.w $f2, $f2
		
		div.s $f3, $f1, $f2
		print_str("Average = ")
		print_float($f3)
		done
		
		
		
		