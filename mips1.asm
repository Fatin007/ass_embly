.data
	ch1: .byte 68
	ch2: .byte 101
	ch3: .byte 103
	ch4: .byte 114
	ch5: .byte 101
	ch6: .byte 101
	ch8: .byte 32
	ch9: .byte 75
	ch10: .byte 105
	ch11: .byte 32
	ch12: .byte 77
	ch13: .byte 97
	ch14: .byte 97
	ch15: .byte 32
	ch16: .byte 75
	ch17: .byte 105
	ch18: .byte 32
	ch19: .byte 67
	ch20: .byte 104
	ch21: .byte 42
	ch22: .byte 42
	ch23: .byte '\n'
.text
main:
	li $v0, 11
	lb $a0, ch1
	syscall
	
	lb  $a0, ch2
	syscall
	
	lb $a0, ch3
	syscall
	
	lb $a0, ch4
	syscall
	
	lb $a0, ch5
	syscall
	
	lb $a0, ch6
	syscall
	
	lb $a0, ch8
	syscall
	
	lb $a0, ch9
	syscall
	
	lb $a0, ch10
	syscall
	
	lb $a0, ch11
	syscall
	
	lb $a0, ch12
	syscall
	
	lb $a0, ch13
	syscall
	
	lb $a0, ch14
	syscall
	
	lb $a0, ch15
	syscall
	
	lb $a0, ch16
	syscall
	
	lb $a0, ch17
	syscall
	
	lb $a0, ch18
	syscall
	
	lb $a0, ch19
	syscall
	
	lb $a0, ch20
	syscall
	
	lb $a0, ch21
	syscall
	
	lb $a0, ch22
	syscall
	
	lb $a0, ch23
	syscall
	
	li $v0, 10
	syscall