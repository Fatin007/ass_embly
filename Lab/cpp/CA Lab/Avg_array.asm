.data
    array: .space 1000
    ques: .asciiz"Enter numbers of integers: "
    ent: .asciiz"Enter the numbers: "
    avg: .asciiz"Average is: "
 .macro print_msg(%msg)
    li $v0,4
    la $a0,%msg
    syscall
.end_macro

.macro read_int(%storeLoc)
    li $v0,5
    syscall
    move %storeLoc,$v0
.end_macro

.macro print_int(%int)
    li $v0,1
    move $a0, %int
    syscall
.end_macro

.macro print_float(%float)
    li $v0,2
    mov.s $f12, %float
    syscall
.end_macro
      
.text
main:
    print_msg(ques)
    read_int($s0)
    mul $s0,$s0,4  #number of elements
    li $t0,0   #iteration
    li $s1,0  #sum
    print_msg(ent)
takeInt:
    beq $t0, $s0, printAvg
    read_int($t1)
    sw $t1, array($t0)
    add $t0,$t0,4
    add $s1,$s1,$t1
    j takeInt
printAvg:
    li $t3,4
    div $s0,$t3
    mflo $t1
    mtc1 $t1,$f1
    mtc1 $s1,$f2
    cvt.s.w $f2, $f2
    cvt.s.w $f1,$f1
    div.s $f0,$f2,$f1
    print_msg(avg)
    print_float($f0)
    j exit
exit: 
    li $v0, 10
    syscall
    
         
            
                  