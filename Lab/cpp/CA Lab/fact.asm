.data
    msg1: .asciiz "Enter a number: "
    msg2: .asciiz "Factorial: "
    newLine: .asciiz "\n"

.text
.globl main

main:
    # Prompt user for input
    li $v0, 4
    la $a0, msg1
    syscall

    # Read the integer
    li $v0, 5
    syscall
    move $a0, $v0  # Store input in $a0 (argument for function)

    # Call factorial_recursive(n)
    jal factorial_recursive

    # Print "Factorial: "
    li $v0, 4
    la $a0, msg2
    syscall

    # Print the result
    li $v0, 1
    move $a0, $v1  # Factorial result is in $v1
    syscall

    # Print new line
    li $v0, 4
    la $a0, newLine
    syscall

    # Exit program
    li $v0, 10
    syscall

# Recursive Factorial Function: factorial_recursive(n)
# Input: $a0 = n
# Output: $v1 = n!
factorial_recursive:
    # Base case: if n == 0, return 1
    beqz $a0, base_case

    # Save return address and argument (n) on the stack
    addi $sp, $sp, -8  # Allocate space on stack
    sw $ra, 0($sp)     # Save return address
    sw $a0, 4($sp)     # Save argument n

    # Recursive call: factorial(n-1)
    addi $a0, $a0, -1  # n - 1
    jal factorial_recursive

    # Restore saved values
    lw $a0, 4($sp)     # Restore n
    lw $ra, 0($sp)     # Restore return address
    addi $sp, $sp, 8   # Deallocate space on stack

    # Compute n * factorial(n-1)
    mul $v1, $a0, $v1
    jr $ra  # Return

# Base case: return 1 for factorial(0)
base_case:
    li $v1, 1
    jr $ra  # Return
