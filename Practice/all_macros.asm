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

.macro print_float(%x)
    li $v0, 2
    mov.s $f12, %x
    syscall
.end_macro

.macro print_double(%x)
    li $v0, 3
    mov.d $f12, %x
    syscall
.end_macro

.macro input_int (%x)
	li $v0, 5
	syscall
	move %x,$v0
	.end_macro

.macro input_float(%x)
    li $v0, 6
    syscall
    mov.s %x, $f0
.end_macro

.macro input_double(%x)
    li $v0, 7
    syscall
    mov.d %x, $f0
.end_macro

.macro input_string(%prompt, %buffer, %max_length)
    .data
    prompt_input_str: .asciiz %prompt
    buffer: .space %max_length
    .text
    li $v0, 4
    la $a0, prompt_input_str
    syscall
    li $v0, 8
    la $a0, buffer
    li $a1, %max_length
    syscall
    la %buffer, buffer
.end_macro

.macro done
    li $v0, 10
    syscall
.end_macro

.macro int_to_float(%x, %y)
    mtc1 %x, %y
    cvt.s.w %y, %y
.end_macro