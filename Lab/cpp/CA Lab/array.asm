.data
     array: .space 2000
     space: .asciiz" "
     howMany: .asciiz"Enter the number of integer less than 500: "
     inputMsg: .asciiz"Enter the element of array: \n"
     outputMsg: .asciiz"Array: "
.text
main: 
     li $v0,4
     la $a0,howMany
     syscall
     
     li $v0,5
     syscall
     move $s1,$v0
     mul $s1,$s1,4
     
     li $v0,4
     la $a0,inputMsg
     syscall
     addi $s0,$zero,0
     
inputLoop:
     beq $s0,$s1,output
     li $v0,5
     syscall
     move $t1,$v0
     
     sw $t1,array($s0)
     addi $s0,$s0,4
     j inputLoop
output:
     li $v0,4
     la $a0,outputMsg
     syscall
     addi $s0,$zero,0
printLoop:
     beq $s0,$s1,exit
     lw $t4,array($s0)
     li $v0,1
     move $a0,$t4
     syscall
     
     li $v0,4
     la $a0,space
     syscall
     
     addi $s0,$s0,4
     j printLoop
     
exit:
     li $v0,10
     syscall
     
     