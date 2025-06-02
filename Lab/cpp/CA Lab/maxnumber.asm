.data
   array: .space 1000 # 1000/4 = space for 250 integers (32-bit)
   ques: .asciiz "Enter Number of integers(Max 250): "
   enter: .asciiz "Enter the numbers: "
   max: .asciiz "Max is: "
   newLine: .asciiz"\n"
.macro print_msg(%msg)
   li $v0,4
   la $a0,%msg
   syscall
.end_macro

.macro read_int(%storelocation)
   li $v0,5
   syscall
   move %storelocation $v0
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
   print_msg(ques)
   read_int($s0)
   mul $s0,$s0,4
   li $t0,0
   li $s1,0 #MAX Value
   print_msg(enter)

takeInt:
   beq $t0,$s0,printMax
   read_int($t1)
   sw $t1,array($t0)
   bgt $t1, $s1,setNewMax
   add $t0,$t0,4
   j takeInt

setNewMax:
   move $s1,$t1
   add $t0,$t0,4
   j takeInt

printMax:
   print_msg(max)
   print_int($s1)
   print_msg(newLine)
   j exit

exit:
   li,$v0,10
   syscall