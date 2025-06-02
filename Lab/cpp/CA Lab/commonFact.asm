.data
   msg1: .asciiz "Enter first number: "
   msg2: .asciiz "Enter second number: "
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
   li $v0,1
   move $a0,%ra
   syscall
.end_macro

.text

main:
   print_msg(msg1)
   read_int($s0)
   print_msg(msg2)
   read_int($s1)
   li $t0,1
   blt $s0,$s1,s0lt
   blt $s1,$s0,s1lt

s0lt:
   bgt $t0,$s0,exit
   rem $t1,$s0,$t0
   rem $t2,$s1,$t0

   beqz $t1,intermediate0

   addi $t0,$t0,1

   j s0lt

s1lt:
   bgt $t0,$s1,exit
   rem $t1,$s0,$t0
   rem $t2,$s1,$t0

   beqz $t1,intermediate1

   addi $t0,$t0,1

   j s1lt

exit:

   li $v0,10
   syscall               

 

intermediate0:
   beq $t1,$t2,printFactors0
   addi $t0,$t0,1
   j s0lt

 

printFactors0:
   print_int($t0)
   print_msg(msgSpace)
   addi $t0,$t0,1
   j s0lt

intermediate1:
   beq $t1,$t2,printFactors1
   addi $t0,$t0,1
   j s1lt

printFactors1:
   print_int($t0)
   print_msg(msgSpace)
   addi $t0,$t0,1
   j s1lt