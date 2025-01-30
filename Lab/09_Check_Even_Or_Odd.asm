.data
	ms1: .asciiz "Enter your number: "
	Ev: .asciiz "Even"
	Od: .asciiz "Odd"
.text
main:
	li $v0,4
	la $a0,ms1
	syscall
	
	li $v0, 5
  	syscall
  	move $t0, $v0
  	
  	addi $t1, $zero, 2
  	
  	div $t0, $t1
  	
  	mfhi $t2
  	
  	beqz $t2, even
  	j odd
  	
  	even:
  		li $v0, 4
  		la $a0, Ev
  		syscall
  		j exit
  		
  	odd:
  		li $v0, 4
  		la $a0, Od
  		syscall
  		j exit
	
	exit:
		li $v0,10
		syscall
