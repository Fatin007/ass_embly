.data
    msg1: .asciiz "Enter number of Fibonacci terms: "
    msg2: .asciiz "Fibonacci Series: "
    space: .asciiz " "
    newLine: .asciiz "\n"

.text
.globl main

main:
    
    li $v0, 4
    la $a0, msg1
    syscall

    
    li $v0, 5
    syscall
    move $t0, $v0  

    
    blez $t0, exit_program  # If input is 0 or negative, exit

    
    li $v0, 4
    la $a0, msg2
    syscall

    
    li $t1, 0  
    li $t2, 1  # Second Fibonacci number (Fib(1))

    # Print first number
    li $v0, 1
    move $a0, $t1
    syscall

    # Check if only one term is needed
    beq $t0, 1, exit_program

    # Print space
    li $v0, 4
    la $a0, space
    syscall

    # Print second number
    li $v0, 1
    move $a0, $t2
    syscall

    # Check if only two terms are needed
    beq $t0, 2, exit_program

    # Fibonacci loop setup
    li $t3, 2  # Counter (starting from 2 since first two are printed)

fib_loop:
    # Compute next Fibonacci number: Fib(n) = Fib(n-1) + Fib(n-2)
    add $t4, $t1, $t2  # t4 = t1 + t2

    # Print space
    li $v0, 4
    la $a0, space
    syscall

    # Print Fibonacci number
    li $v0, 1
    move $a0, $t4
    syscall

    # Shift values for next iteration
    move $t1, $t2  # t1 = previous Fib(n-1)
    move $t2, $t4  # t2 = current Fib(n)

    # Increment counter
    addi $t3, $t3, 1
    blt $t3, $t0, fib_loop  # Continue until reaching the term count

exit_program:
    # Print new line
    li $v0, 4
    la $a0, newLine
    syscall

    # Exit
    li $v0, 10
    syscall
