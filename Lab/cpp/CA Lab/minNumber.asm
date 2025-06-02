.data
   array: .space 1000 # 1000/4 = space for 250 integers (32-bit)
   ques: .asciiz "Enter Number of integers(Max 250): "
   enter: .asciiz "Enter the numbers: "
   min: .asciiz "Min is: "
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
   li $s1,200000000 #Min Value
   print_msg(enter)

takeInt:
   beq $t0,$s0,printMin
   read_int($t1)
   sw $t1,array($t0)
   blt $t1, $s1,setNewMin
   add $t0,$t0,4
   j takeInt

setNewMin:
   move $s1,$t1
   add $t0,$t0,4
   j takeInt

printMin:
   print_msg(min)
   print_int($s1)
   j exit

exit:
   li,$v0,10
   syscall