.data
     comma:.asciiz","
     full_stop:.asciiz"."
.text
main:
    #initialize i=1
    li $t0,0
    li $t1,0

for_loop:

    #increment i                                                     
    addi $t0,$t0,1
    bgt $t0,10,Exit
    add $t1,$t1,$t0
    
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    j for_loop
Exit:
li $v0,1
move $a0,$t1
syscall
li $v0,10
syscall