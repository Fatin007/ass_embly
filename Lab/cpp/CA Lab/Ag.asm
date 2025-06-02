.data
     promt: .asciiz"Enter the limit: "
     result: .asciiz"Average: "
.text
main:
     li $v0,4
     la $a0,promt
     syscall
     li $t0,1  #iteration
     li $t1,0   #sum
     li $t3,0   #limit
     li $t4,0  #avg-count
     li $v0,5
     syscall
     move $t3,$v0
input_loop:
     add $t1,$t1,$t0
     add $t0,$t0,2
     add $t4,$t4,1
     bgt $t0,$t3,exit
     j input_loop
exit:
     li $v0,4
     la $a0,result
     syscall
     div $t1,$t4
     mflo $t5
     li $v0,1
     move $a0,$t5
     syscall
     
     li $v0,10
     syscall