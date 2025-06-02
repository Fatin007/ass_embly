.data

   array: .space 1000 # 1000/4 = space for 250 integers (32-bit)

   ques: .asciiz "Enter Number of integers(Max 250): "

   numC: .asciiz "Checking number: "

   isEven: .asciiz " is Even"
   
   newL: .asciiz"\n"

.macro print_msg(%msg)
   li $v0,4
   la $a0,%msg
   syscall
.end_macro

.macro read_int(%store)
   li $v0,5
   syscall
   move %store $v0
.end_macro

.macro print_int(%int)
   li $v0,1
   move $a0,%int
   syscall
.end_macro

.text
main:
   print_msg(ques)
   read_int($s0)
   mul $s0,$s0,4
   li $t0,0
takeInt:
   beq $t0,$s0,initializeEvenCheckLoop
   read_int($t1)
   sw $t1,array($t0)
   add $t0,$t0,4
   j takeInt
initializeEvenCheckLoop:
   li $t0,0
evenCheckLoop:
   beq $t0,$s0,exit
   lw $t6,array($t0)
   li $t1,2
   div $t6,$t1
   mfhi $t2
   beq $t2,0,evenmsg
   add $t0,$t0,4
   j evenCheckLoop                                                                                                                                                                                                                                                                                            

evenmsg:

   print_int($t6)
   print_msg(isEven)
   print_msg(newL)
   add $t0,$t0,4
   j evenCheckLoop

exit:
   li $v0,10
   syscall