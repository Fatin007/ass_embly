.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
msg1: .asciiz "Enter element "
colon: .asciiz ": "
msg2: .asciiz "Enter element to count frequency: "
result: .asciiz "Frequency of the element: "

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
    beq $t0, $s0, end
    
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
    
end:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    li $t0, 0
    li $t2, 0
    
cnt_loop:
    beq $t0, $s0, end_cnt
    
    sll $t1, $t0, 2
    lw $t3, arr($t1)
    
    bne $t3, $s1, skip_cnt
    addi $t2, $t2, 1
    
skip_cnt:
    addi $t0, $t0, 1
    j cnt_loop
    
end_cnt:
    li $v0, 4
    la $a0, result
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10
    syscall