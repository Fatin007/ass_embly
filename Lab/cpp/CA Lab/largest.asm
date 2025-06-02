.data
     promt: .asciiz"Enter 3 integers, one at a time"
     result: .asciiz" The largest number is: "
.text
main:
     li $v0,4
     la $a0,promt
     syscall
     li $t0,3
     li $t1,0
     li $t2,0
input_loop:
     li $v0,5
     syscall
     move $t3,$v0
     bge $t3,$t2,update_max
     j next_iteration
update_max:
     move $t2,$t3	
next_iteration:
     addi $t1,$t1,1
     bne $t1,$t0,input_loop
     li $v0,4
     la $a0,result
     syscall
     li $v0,1
     move $a0,$t2
     syscall
     li $v0,10
     syscall

     