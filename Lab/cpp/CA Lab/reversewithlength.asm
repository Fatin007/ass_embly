.data

   buffer: .space 256

   msg0: .asciiz "Enter length of String(including spaces): "

   msg1: .asciiz "Enter String: "

   msg2: .asciiz "Reverse of String is: "

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
   print_msg(msg0)
   read_int($s0)
   print_msg(msg1) 
   # s0 = length of string
   addi $s0, $s0, 1
   move $a1, $s0
   read_str(buffer)
   print_msg(newLine)
   print_msg(msg2)

print_reverse:
   la $s2,buffer
   add $s3,$s2,$s0
   loopReverse:
       li $v0,11
       lb $a0,($s3)
       syscall

       beq $s3, $s2, exit_prg

       addi $s3, $s3, -1
       j loopReverse

exit_prg:

   li $v0 10

   syscall