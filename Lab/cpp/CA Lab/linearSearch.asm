.data

   array: .space 1000 # 1000/4 = space for 250 integers (32-bit)
   question: .asciiz "Enter Number of integers(Max 250): "
   enter: .asciiz "Enter the numbers: "
   search: .asciiz "Enter the number to be searched: "
   found: .asciiz "Number found at index: "
   notFound: .asciiz "Number not found"
   newLine: .asciiz "\n"
   debug: .asciiz "Value of mfhi $t1"
   debug1: .asciiz "Value of $s0: "

.macro print_msg(%msg)
   la $a0,%msg
   li $v0,4
   syscall
.end_macro

.macro read_int(%storelocation)
   li $v0,5
   syscall
   move %storelocation,$v0
.end_macro

.macro print_int(%int)
   li $v0,1
   move $a0,%int
   syscall
.end_macro

.macro print_float(%f)
   li $v0,2
   mov.s $f12, %f
   syscall
.end_macro

.text
main:
   print_msg(question)
   read_int($s0)
   mul $s0,$s0,4
   li $t0,0
   print_msg(enter)

takeInt:
   beq $t0,$s0,askForSearch
   read_int($t1)
   sw $t1,array($t0)
   add $t0,$t0,4
   j takeInt

askForSearch:
   print_msg(search)
   read_int($s1)
   li $t0,0

searchFunction:
   beq $t0,$s0,elementNotFound
   lw $t1,array($t0)
   beq $t1,$s1,elementFound
   add $t0,$t0,4
   j searchFunction

 

elementFound:
   li $t4, 4
   div $t0,$t4
   mflo $t0
   print_msg(found)
   print_int($t0)
   print_msg(newLine)
   j exit

elementNotFound:
   print_msg(notFound)
   j exit

exit:
   li $v0,10
   syscall

