.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Number of digits: "

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
    beq $t0, $zero, zero_case
    
    bltz $t0, negative_thakle
    j loop
    
negative_thakle:
    neg $t0, $t0
    
loop:
    beq $t0, $zero, end
    div $t0, $t0, 10
    addi $t1, $t1, 1
    j loop
    
zero_case:
    li $t1, 1
    
end:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall