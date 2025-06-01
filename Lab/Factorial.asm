.data
    msg1: .asciiz "Enter a number: "
    msg2: .asciiz "Factorial is: "
    nl: .asciiz "\n"

.text
.global main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $t1, 1 
    
    beqz $t0, print
    beq $t0, 1, print
    
    li $t2, 2
    
loop:
    bgt $t2, $t0, print
    mul $t1, $t1, $t2
    addi $t2, $t2, 1 
    j loop
    
print:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li $v0, 10
    syscall

