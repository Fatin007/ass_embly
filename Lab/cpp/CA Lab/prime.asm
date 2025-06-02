.data
     promt: .asciiz"Enter the number: "
     result_yes: .asciiz"Yes"
     result_no: .asciiz"No"
.text
main:
     li $v0,4
     la $a0,promt
     syscall
     li $v0,5
     syscall
     li $t0,0
     move $t0,$v0
     syscall
     li $t1,2 #iteration
     
input_loop:
     beq $t1,$t0,prime
     div $t0,$t1
     mfhi $t4
     beq $t4,0,not_prime
     add $t1,$t1,1
     j input_loop
not_prime:
     li $v0,4
     la $a0,result_yes
     j exit
prime:
     li $v0,4
     la $a0,result_no
     j exit
exit:
     li $v0,10
     syscall