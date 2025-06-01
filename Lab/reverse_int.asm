.data
msg1: .asciiz "Enter an integer: "
msg2: .asciiz "Reversed integer: "

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
    
reverse_loop:
    beq $t0, $zero, end_reverse
    
    mul $t1, $t1, 10
    rem $t2, $t0, 10
    add $t1, $t1, $t2
    div $t0, $t0, 10
    
    j reverse_loop
    
end_reverse:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall