.data
    msg1: .asciiz "Enter the number of digits: "
    msg2: .asciiz "Enter the number: "
    msg3: .asciiz "Reversed number: "
    newLine: .asciiz "\n"

.text
.globl main

main:
    # Prompt user for number of digits
    li $v0, 4
    la $a0, msg1
    syscall

    # Read number of digits
    li $v0, 5
    syscall
    move $t0, $v0  # Store number of digits in $t0

    # Prompt user for number
    li $v0, 4
    la $a0, msg2
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t1, $v0  # Store the number in $t1

    # Print "Reversed number: "
    li $v0, 4
    la $a0, msg3
    syscall

    # Reverse logic
    li $t2, 0  # Reversed number initialized to 0

reverse_loop:
    beqz $t0, print_result  # If no more digits, print result

    li $t3, 10
    div $t1, $t3    # Divide number by 10
    mfhi $t4        # Get remainder (last digit)
    mflo $t1        # Get quotient (remaining number)

    # Print the extracted digit
    li $v0, 1
    move $a0, $t4
    syscall

    sub $t0, $t0, 1  # Decrease digit count
    j reverse_loop    # Repeat for next digit

print_result:
    # Print new line
    li $v0, 4
    la $a0, newLine
    syscall

    # Exit
    li $v0, 10
    syscall
