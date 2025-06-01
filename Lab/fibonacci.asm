.data
msg1: .asciiz "Enter the number: "
space: .asciiz " "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $t1, 0
    li $t2, 1
    
    li $v0, 1
    li $a0, 0
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    li $v0, 1
    li $a0, 1
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    li $t3, 2
    
loop:
    beq $t3, $t0, exit
    
    add $t4, $t1, $t2
    move $t1, $t2
    move $t2, $t4
    
    li $v0, 1
    move $a0, $t4
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    addi $t3, $t3, 1
    j loop
    
exit:
    li $v0, 10
    syscall