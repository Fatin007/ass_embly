.data
    msg1: .asciiz "Enter a positive number: "
    msg2: .asciiz "Number of trailing zeros: "
    newline: .asciiz "\n"

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
    
    move $t2, $t0
    
loop:
    div $t2, $t2, 5
    beqz $t2, next
    add $t1, $t1, $t2
    j loop
    
next:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 10
    syscall