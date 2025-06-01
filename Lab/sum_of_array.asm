.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
msg1: .asciiz "Enter element "
colon: .asciiz ": "
msg2: .asciiz "Sum of arr elements: "

.text
.globl main

main:
    li $v0, 4
    la $a0, arr_sz
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    li $t0, 0
    
in_loop:
    beq $t0, $s0, end_in
    
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, colon
    syscall
    
    li $v0, 5
    syscall
    
    sll $t1, $t0, 2
    sw $v0, arr($t1)
    
    addi $t0, $t0, 1
    j in_loop
    
end_in:
    li $t0, 0
    li $t3, 0
    
loop:
    beq $t0, $s0, end_sum
    
    sll $t1, $t0, 2
    lw $t2, arr($t1)
    
    add $t3, $t3, $t2
    
    addi $t0, $t0, 1
    j loop
    
end_sum:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 10
    syscall