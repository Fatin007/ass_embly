.data
     msg1: .asciiz "Enter any number: "            #input message
     msg2: .asciiz "Square of the number is: "     #output message
     
.text
     #input message
      la $a0,msg1
      li $v0,4
      syscall
     
     #Taking integer input
      li $v0,5  
      syscall
      move $t0,$v0
      
     jal Square   #Jump and Link to Square function
     
     #Terminating the program
       li $v0,10
       syscall
Square:
       mul $t1,$t0,$t0
   
       #Output message
        la $a0,msg2
        li $v0,4
        syscall
       
       #Printing square of the number
        move $a0,$t1
        li $v0,1
        syscall
       
       jr $ra
