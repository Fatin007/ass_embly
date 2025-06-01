.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
nsg1: .asciiz "Enter element "
colon: .asciiz ": "
msg2: .asciiz "Odd numbers in the arr: "
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
    la $a0, nsg1
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
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $t0, 0
    
print_loop:
    beq $t0, $s0, end_print
    
    sll $t1, $t0, 2
    lw $t2, arr($t1)
    
    andi $t3, $t2, 1
    beq $t3, $zero, skip_print
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
skip_print:
    addi $t0, $t0, 1
    j print_loop
    
end_print:
    li $v0, 10
    syscall