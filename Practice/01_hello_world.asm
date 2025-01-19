.data
	msg: .asciiz "Hello Mother Father"
.text
	li $v0,4
	la $a0,msg
	syscall
	
	