.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Square of the number is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    mul $t1, $t0, $t0
    
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall