.data
    msg1: .asciiz "Enter a number: "
    msg2: .asciiz "Reversed number: "
    newLine: .asciiz "\n"

.text
.globl main

main:
    # Prompt user for a number
    li $v0, 4
    la $a0, msg1
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0  # Store number in $t0

    # Initialize reversed number to 0
    li $t1, 0  

reverse_loop:
    # Check if the number is 0, if yes, print the reversed number
    beqz $t0, print_result

    # Extract last digit
    li $t2, 10
    div $t0, $t2
    mfhi $t3    # Get remainder (last digit)
    mflo $t0    # Get quotient (remaining number)

    # Multiply reversed number by 10 and add the last digit
    mul $t1, $t1, $t2
    add $t1, $t1, $t3

    # Repeat unt
