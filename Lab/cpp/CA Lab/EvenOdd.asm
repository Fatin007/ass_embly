.data
     num1:.asciiz"Enter number: "
     odd:.asciiz"Given number is odd."
     even:.asciiz"Given number is even."
.text
main:
     li $v0,4
     la $a0,num1
     syscall
     li $v0,5
     syscall
     move $s0,$v0
     li $s1,2
     div $s0,$s1
     mfhi $s3
     beq $s3,0,Exit
     li $v0,4
     la $a0,odd
     syscall
    
Exit:
li $v0,4
la $a0,even
syscall
li $v0,10
syscall