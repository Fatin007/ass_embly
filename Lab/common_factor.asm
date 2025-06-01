.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
msg3: .asciiz "Greatest Common Factor is: "

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
    
loop:
    beq $t1, $zero, next
    
    div $t0, $t1
    move $t0, $t1
    mfhi $t1
    
    j loop
    
next:
    li $v0, 4
    la $a0, msg3
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 10
    syscall