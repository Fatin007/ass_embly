.data

   buffer: .space 256

   msg1: .asciiz "Enter String: "

   msg2: .asciiz "Length of String is: "

   newLine: .asciiz "\n"
   
   
.macro print_msg(%msg)
   li $v0,4
   la $a0, %msg
   syscall
.end_macro

.macro read_int(%int)
   li $v0,5
   syscall
   move %int,$v0
.end_macro
.macro read_str(%str)
   li $v0,8
   la $a0, %str
   syscall
.end_macro

.text

.globl main

main:

   print_msg(msg1)

   la $s0 buffer
 

read_string:

   li $v0 12

   syscall

   move $t0 $v0

   beq $t0 10 finish_read

   sb $t0 0($s0)

   addi $s0 $s0 1

   j read_string

exit_prg:

 

   li $v0 10

   syscall

finish_read:

   li $t0 0

   sb $t0 0($s0)

   j calculate_str_length

calculate_str_length:

   li $t0 0

   la $t1 buffer

   li $t7 0

   loop:

   lb $t2,0($t1)

   beq $t2 $t7 print_length

   addi $t0 $t0 1

   addi $t1 $t1 1

   j loop

 

print_length:

   li $v0 4

   la $a0 msg2

   syscall

   li $v0 1

   move $a0 $t0

   move $s7 $t0

   syscall

   li $v0 4

   la $a0 newLine

   syscall

   j print_reverse

print_reverse:

   la $s2 buffer

   add $s3,$s2,$s7

   loopReverse:

       li $v0,11

       lb $a0,($s3)

       syscall

       beq $s3,$s2,exit_prg

       addi $s3,$s3, -1

       j loopReverse

  