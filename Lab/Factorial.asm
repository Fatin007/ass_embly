.macro print_str (%str)
.data
    myLabel: .asciiz %str
.text
    li $v0, 4
    la $a0, myLabel
    syscall
.end_macro

.macro print_int (%x)
    li $v0, 1
    move $a0, %x
    syscall
.end_macro

.macro input_int (%x)
    li $v0, 5
    syscall
    move %x, $v0
.end_macro

.macro done
    li $v0, 10
    syscall
.end_macro

.text
.global main
main

