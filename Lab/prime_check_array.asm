.data
arr: .word 0:100
arr_sz: .asciiz "Enter the size of arr: "
msg1: .asciiz "Enter element "
colon: .asciiz ": "
msg2: .asciiz "Prime numbers in the arr: "
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
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $t0, 0
    
check_loop:
    beq $t0, $s0, end_check
    
    sll $t1, $t0, 2
    lw $t2, arr($t1)
    
    move $a0, $t2
    jal is_prime
    
    beq $v0, $zero, not_prime
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
not_prime:
    addi $t0, $t0, 1
    j check_loop
    
end_check:
    li $v0, 10
    syscall

is_prime:
    slti $t3, $a0, 2
    bne $t3, $zero, not_prime_ret
    
    li $t3, 2
    
prime_loop:
    mul $t4, $t3, $t3
    slt $t5, $a0, $t4
    bne $t5, $zero, prime_ret
    
    div $a0, $t3
    mfhi $t4
    beq $t4, $zero, not_prime_ret
    
    addi $t3, $t3, 1
    j prime_loop
    
prime_ret:
    li $v0, 1
    jr $ra
    
not_prime_ret:
    li $v0, 0
    jr $ra