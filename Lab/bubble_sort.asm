.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
msg1: .asciiz "Enter element "
colon: .asciiz ": "
result: .asciiz "Sorted arr: "
space: .asciiz " "

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
    
outer_loop:
    addi $t1, $s0, -1
    sub $t1, $t1, $t0
    beqz $t1, end_outer
    
    li $t1, 0
    
inner_loop:
    addi $t2, $s0, -1
    sub $t2, $t2, $t0
    beq $t1, $t2, end_inner
    
    sll $t3, $t1, 2
    lw $t4, arr($t3)
    
    addi $t5, $t1, 1
    sll $t5, $t5, 2
    lw $t6, arr($t5)
    
    ble $t4, $t6, skip_swap
    
    sw $t6, arr($t3)
    sw $t4, arr($t5)
    
skip_swap:
    addi $t1, $t1, 1
    j inner_loop
    
end_inner:
    addi $t0, $t0, 1
    j outer_loop
    
end_outer:
    li $v0, 4
    la $a0, result
    syscall
    
    li $t0, 0
    
print_loop:
    beq $t0, $s0, end_print
    
    sll $t1, $t0, 2
    lw $t2, arr($t1)
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    addi $t0, $t0, 1
    j print_loop
    
end_print:
    li $v0, 10
    syscall