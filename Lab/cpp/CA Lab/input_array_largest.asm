.data
    array:      .space 2000        
     prompt1:    .asciiz "Enter the number of elements: "
    prompt2:    .asciiz "Enter element: "
    result:     .asciiz "The largest element is: " 

.text
    .globl main
main:
    
    li $v0, 4                
    la $a0, prompt1          
    syscall
    
    
    li $v0, 5                
    syscall
    move $t0, $v0            
    
    li $t1, 0                
    la $t2, array            

input_loop:
    bge $t1, $t0, find_max   
    
    
    li $v0, 4
    la $a0, prompt2
    syscall
    
    
    li $v0, 5
    syscall
    sw $v0, 0($t2)           
    
    addi $t1, $t1, 1         
    addi $t2, $t2, 4         
    j input_loop             

find_max:
    la $t2, array            
    lw $t3, 0($t2)           
    li $t1, 1                
    
max_loop:
    bge $t1, $t0, print_max  
    
    addi $t2, $t2, 4         
    lw $t4, 0($t2)          
    
    
    ble $t4, $t3, skip_update
    move $t3, $t4            
    
skip_update:
    addi $t1, $t1, 1         
    j max_loop               

print_max:
    
    li $v0, 4
    la $a0, result
    syscall
    
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    
    li $v0, 10
    syscall
