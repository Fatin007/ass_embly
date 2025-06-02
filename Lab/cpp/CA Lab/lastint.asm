.data
    msg1: .asciiz "Enter first number: "
    msg2: .asciiz "Enter second number: "
    msg_same: .asciiz "The numbers have the same last digit.\n"
    msg_diff: .asciiz "The numbers have different last digits.\n"

.text
.globl main

main:
    # Prompt user for first number
    li $v0, 4
    la $a0, msg1
    syscall

    # Read first number
    li $v0, 5
    syscall
    move $t0, $v0  # Store first number in $t0

    # Prompt user for second number
    li $v0, 4
    la $a0, msg2
    syscall

    # Read second number
    li $v0, 5
    syscall
    move $t1, $v0  # Store second number in $t1

    # Extract last digits
    li $t2, 10
    div $t0, $t2
    mfhi $t3  # Last digit of first number

    div $t1, $t2
    mfhi $t4  # Last digit of second number

    # Compare last digits
    beq $t3, $t4, same_last_digit

    # If not equal, print "different last digits"
    li $v0, 4
    la $a0, msg_diff
    syscall
    j exit_program

same_last_digit:
    # If equal, print "same last digit"
    li $v0, 4
    la $a0, msg_same
    syscall

exit_program:
    # Exit the program
    li $v0, 10
    syscall
