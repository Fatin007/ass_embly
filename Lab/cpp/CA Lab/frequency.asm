.data

   array: .space 10000 # 10000/4 = 2500 numbers

   freq: .space 200000

   msg1: .asciiz "Enter number of elements (max 2500) : "

   msg2: .asciiz "Freq Count of "

   msg3: .asciiz "Enter element "

   msg4: .asciiz ": " 

   newLine: .asciiz "\n"

.text

.globl main

.macro print_msg(%ms)

   li $v0 4

   la $a0 %ms

   syscall

.end_macro

.macro print_int(%ms)

   li $v0 1

   move $a0 %ms

   syscall

.end_macro

.macro read_int(%ms)

   li $v0 5

   syscall

   move %ms $v0

.end_macro

main:

   print_msg(msg1)

   read_int($s0)

   li $t0 0

   la $s1 array

takeInput:

   beq $t0 $s0 countFreq

   print_msg(msg3)

   print_int($t0)

   print_msg(msg4)

   read_int($t1)

   sw $t1 ($s1)

   addi $s1 $s1 4

   addi $t0 $t0 1

   j takeInput

countFreq:

   li $t0 0

   la $s1 array

   la $s2 freq

   loop:

   beq $t0 $s0 showFreq

   lw $t2 ($s1)

   add $t2 $s2 $t2

   lb $t3 ($t2)

   addi $t3 $t3 1

   sb $t3 ($t2)

   add $s1 $s1 4

   addi $t0 $t0 1

   j loop

   

showFreq:

   li $t0 0

   la $s3 freq

   li $s4 200000

   loop2:

   beq $t0 $s4 exit

   add $t1 $s3 $t0

   lb $t5 0($t1)

   bgtz $t5 print_freq

   addi $t0 $t0 1

   j loop2

print_freq:

   print_msg(msg2)

   print_int($t0)

   print_msg(msg4)

   print_int($t5)

   print_msg(newLine)

   addi $t0 $t0 1

   j loop2

 

exit:

   li $v0 10

   syscall