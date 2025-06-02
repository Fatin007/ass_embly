.data
   array: .space 1000 # 1000/4 = space for 250 integers (32-bit)
   question: .asciiz "Enter Number of integers: "
   numberCheck: .asciiz "Checking number: "
   primemsg: .asciiz " is prime"
   notprimemsg: .asciiz " is not prime"
   sqrtvalue: .asciiz "Square root value is: "
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
   move %storelocation $v0
.end_macro

.macro print_int(%int)
   li $v0,1
   move $a0,%int
   syscall
.end_macro

.macro print_float(%f)
   li $v0,2
   mov.s $f12 %f
   syscall
.end_macro

.macro read_float()
   li $v0,6
   syscall
.end_macro

.text
main:
   print_msg(question)
   read_int($t7) #value of n
   mul $t7,$t7, 4
   li $t0 0 # i=0

takeInt:
   beq $t0,$t7,initializePrimeLoop
   read_int($t1) #value of x
   sw $t1,array($t0) #array[i]
   add $t0 $t0 4 #i++
   j takeInt

initializePrimeLoop:
   li $t2,0 #i=0

primeLoop:
   beq $t2, $t7, exit
   lw $t6,array($t2) #array[i]
   j convertToWord

     

convertToWord:
   print_msg(numberCheck)
   print_int($t6)
   print_msg(newLine)
   mtc1 $t6, $f0
   cvt.s.w $f0, $f0
   sqrt.s $f0, $f0
  
   print_msg(sqrtvalue)
   #print_int($s1)
   mov.s $f12,$f0
   li $v0,2
   syscall
   cvt.w.s $f1, $f0
   mfc1 $s1,$f1 
   print_msg(newLine)                              
   li $t0,2

forLoop:

   bgt  $t0,$s1,execFinalCode
   div $t6, $t0
   print_msg(numberCheck)
   print_int($t0)
   print_msg(newLine)
   mfhi $t1
   beq $t1,0,notPrime
   add $t0,$t0,1
   j forLoop                                              

execFinalCode:
   print_int($t6)
   print_msg(primemsg)
   print_msg(newLine)
   add $t2,$t2,4
   j primeLoop                                                                                                            

notPrime:
   print_int($t6)
   print_msg(notprimemsg)
   print_msg(newLine)
   add $t2,$t2,4
   j primeLoop

exit:
   li $v0,10
   syscall
