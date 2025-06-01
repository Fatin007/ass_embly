.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Factorial: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $a0, $v0
    
    jal factorial
    move $t0, $v0
    
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 10
    syscall

factorial:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    
    slti $t0, $a0, 2
    beq $t0, $zero, recursion
    
    li $v0, 1
    addi $sp, $sp, 8
    jr $ra
    
recursion:
    addi $a0, $a0, -1
    jal factorial
    
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8
    
    mul $v0, $a0, $v0
    jr $ra