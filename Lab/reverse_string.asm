.data
buffer: .space 100
msg1: .asciiz "Enter a string: "
msg2: .asciiz "Reversed string: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 8
    la $a0, buffer
    li $a1, 100
    syscall
    
    la $t0, buffer
    
length_loop:
    lb $t1, 0($t0)
    beq $t1, 10, end_length
    beq $t1, 0, end_length
    addi $t0, $t0, 1
    j length_loop
    
end_length:
    la $t1, buffer
    sub $t0, $t0, $t1
    addi $t0, $t0, -1
    
    li $v0, 4
    la $a0, msg2
    syscall
    
    la $t1, buffer
    add $t2, $t1, $t0
    
print_loop:
    bltz $t0, end_print
    
    lb $a0, 0($t2)
    li $v0, 11
    syscall
    
    addi $t2, $t2, -1
    addi $t0, $t0, -1
    j print_loop
    
end_print:
    li $v0, 10
    syscall