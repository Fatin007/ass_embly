.data
   msg1: .asciiz "Enter number: "
   msg2: .asciiz "Number of Digits is: "
   msgRemain: .asciiz "Remainder is: "
   msgNewline: .asciiz "\n"
   msgSpace: .asciiz " "

.macro print_msg(%ra)

   li $v0 4

   la $a0 %ra

   syscall

.end_macro

.macro read_int(%ra)

   li $v0 5

   syscall

   move %ra $v0

.end_macro

.macro print_int(%ra)

   li $v0 1

   move $a0 %ra

   syscall

.end_macro

.text
main:
   print_msg(msg1)
   read_int($s0)
   li $t0,0
   li $s1,10

loop:
   beq $s0, 0, printNumberofDigits
   div $s0,$s1
   mflo $s0
   addi $t0,$t0, 1
   j loop

printNumberofDigits:
   print_msg(msg2)
   print_int($t0)
   print_msg(msgNewline)
   li $v0,10
   syscall

  