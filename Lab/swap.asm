.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
msg3: .asciiz "After swapping, first number: "
msg4: .asciiz "\nAfter swapping, second number: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    move $t2, $t0
    move $t0, $t1
    move $t1, $t2
    
    li $v0, 4
    la $a0, msg3
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, msg4
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall