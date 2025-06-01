.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "The Fibonacci number is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $a0, $v0
    
    jal fibonacci
    move $t0, $v0
    
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 10
    syscall

fibonacci:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    
    slti $t0, $a0, 2
    beq $t0, $zero, recursive
    
    move $v0, $a0
    addi $sp, $sp, 12
    jr $ra
    
recursive:
    addi $a0, $a0, -1
    jal fibonacci
    sw $v0, 8($sp)
    
    addi $a0, $a0, -1
    jal fibonacci
    
    lw $t0, 8($sp)
    add $v0, $v0, $t0
    
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra