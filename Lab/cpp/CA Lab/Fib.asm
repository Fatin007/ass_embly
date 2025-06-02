.data
    msg1: .asciiz "Enter number of Fibonacci term: "
    msg2: .asciiz "Fibonacci: "
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

    
    # Fibonacci loop setup
    li $t3, 2  # Counter (starting from 2 since first two are printed)

fib_loop:
    # Compute next Fibonacci number: Fib(n) = Fib(n-1) + Fib(n-2)
    add $t4, $t1, $t2  # t4 = t1 + t2

    

    # Shift values for next iteration
    move $t1, $t2  # t1 = previous Fib(n-1)
    move $t2, $t4  # t2 = current Fib(n)

    # Increment counter
    addi $t3, $t3, 1
    blt $t3, $t0, fib_loop  # Continue until reaching the term count

exit_program:
    li $v0, 1
    move $a0, $t4
    syscall
    # Exit
    li $v0, 10
    syscall
