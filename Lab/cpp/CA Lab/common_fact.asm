.data
msg1: .asciiz"enter 1st number: "
msg2: .asciiz"Enter 2nd number: "
.text

.macro print_msg(%ra)
	li $v0,4
   	la $a0, %ra
   	syscall
.end_macro
.macro read_int(%ra)
        li $v0,5
   	syscall
   	move %ra,$v0
.end_macro
main:
   print_msg(msg1)
   read_int($s1)
   print_msg(msg2)
   read_int($s2)
   
li $t0,1  

blt $s1,$s2,s1lt_loop
blt $s2,$s1,s2lt_loop   
   
   
   
s1lt_loop:
    bgt $t0,$s1,exit
    rem $t1,$s1,$t0
    rem $t2,$s2,$t0
    seq $t3,$t1,$zero
    seq $t4,$t2,$zero
    beq $t3,$t4,print    
print:
    li $v0,1
    move $a0,$t0
    syscall
    
   
      
   
   