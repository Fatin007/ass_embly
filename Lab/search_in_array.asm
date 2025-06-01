.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
msg1: .asciiz "Enter element "
colon: .asciiz ": "
msg2: .asciiz "Enter element to search: "
found: .asciiz "Element found at index: "
not_found: .asciiz "Element not found."

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
    
input_loop:
    beq $t0, $s0, end_input
    
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
    j input_loop
    
end_input:
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    li $t0, 0
    
search_loop:
    beq $t0, $s0, not_found
    
    sll $t1, $t0, 2
    lw $t2, arr($t1)
    
    beq $t2, $s1, found
    
    addi $t0, $t0, 1
    j search_loop
    
found:
    li $v0, 4
    la $a0, found
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    j exit
    
not_found:
    li $v0, 4
    la $a0, not_found
    syscall
    
exit:
    li $v0, 10
    syscall