.macro pc (%ch)
	li $v0, 11
	lb $a0, %ch
	syscall
.end_macro

.macro tab
	li $v0, 4
	la $a0, t
	syscall
.end_macro

.data
        ch1: .byte 65 
        ch2: .byte 66 
        ch3: .byte 67 
        ch4: .byte 69 
        ch5: .byte 70 
        ch6: .byte 71 
        ch7: .byte 72 
        ch8: .byte 74 
        ch9: .byte 77 
        ch10: .byte 78
        ch11: .byte 83 
        ch12: .byte 85 
        ch13: .byte 97 
        ch14: .byte 98 
        ch15: .byte 99 
        ch16: .byte 100 
        ch17: .byte 101 
        ch18: .byte 102 
        ch19: .byte 103 
        ch20: .byte 104 
        ch21: .byte 105 
        ch22: .byte 107 
        ch23: .byte 108 
        ch24: .byte 109  
        ch25: .byte 110 
        ch26: .byte 111 
        ch27: .byte 112 
        ch28: .byte 114 
        ch29: .byte 115 
        ch30: .byte 116 
        ch31: .byte 117 
        ch32: .byte 118 
        ch33: .byte 119 
        ch34: .byte 120 
        ch35: .byte 121 
        ch36: .byte 122 
        ch37: .byte 39 
        ch38: .byte 45 
        ch39: .byte 46 
        ch40: .byte 49 
        ch41: .byte 51 
        ch42: .byte 55 
        ch43: .byte 58 
        space: .byte 32
	nl: .byte '\n'
	t: .asciiz "\t"
.text
.globl main 
main:
	pc ch1
	pc ch29
	pc ch38
	pc ch29
	pc ch13
	pc ch23
	pc ch13
	pc ch24
	pc ch31
	pc space
	pc ch13
	pc ch23
	pc ch13
	pc ch35
	pc ch22
	pc ch31
	pc ch24
	pc nl
	pc nl
	
	pc ch10
	pc ch13
	pc ch24
	pc ch17
	pc ch43
	tab
	tab
	pc ch9
	pc ch26
	pc ch20
	pc ch13
	pc ch24
	pc ch24
	pc ch13
	pc ch16
	pc space
	pc ch5
	pc ch13
	pc ch30
	pc ch21
	pc ch25
	pc space
	pc ch10
	pc ch31
	pc ch28
	pc nl
	
	pc ch8
	pc ch25
	pc ch12
	pc ch43
	tab
	tab
	pc ch40
	pc ch42
	pc ch30
	pc ch20
	pc space
	pc ch14
	pc ch13
	pc ch30
	pc ch15
	pc ch20
	pc nl
	
	pc ch3
	pc ch11
	pc ch4
	pc ch43
	tab
	tab
	pc ch40
	pc ch41
	pc ch30
	pc ch20
	pc space
	pc ch14
	pc ch13
	pc ch30
	pc ch15
	pc ch20
	pc nl
	
	pc ch3
	pc ch26
	pc ch23
	pc ch23
	pc ch17
	pc ch19
	pc ch17
	pc ch43
	tab
	tab
	pc ch3
	pc ch26
	pc ch34
	pc ch37
	pc ch29
	pc space
	pc ch2
	pc ch13
	pc ch36
	pc ch13
	pc ch28
	pc space
	pc ch6
	pc ch26
	pc ch32
	pc ch30
	pc ch39
	pc space
	pc ch3
	pc ch26
	pc ch23
	pc ch23
	pc ch17
	pc ch19
	pc ch17
	pc nl
	
	pc ch11
	pc ch15
	pc ch20
	pc ch26
	pc ch26
	pc ch23
	pc ch43
	tab
	tab
	pc ch3
	pc ch26
	pc ch34
	pc ch37
	pc ch29
	pc space
	pc ch2
	pc ch13
	pc ch36
	pc ch13
	pc ch28
	pc space
	pc ch6
	pc ch26
	pc ch32
	pc ch30
	pc ch39
	pc space
	pc ch7
	pc ch21
	pc ch19
	pc ch20
	pc space
	pc ch11
	pc ch15
	pc ch20
	pc ch26
	pc ch26
	pc ch23
	pc nl
	pc nl
	
	pc ch7
	pc ch26
	pc ch24
	pc ch17
	pc ch30
	pc ch26
	pc ch33
	pc ch25
	pc ch43
	pc space
	tab
	pc ch3
	pc ch26
	pc ch34
	pc ch37
	pc ch29
	pc space
	pc ch2
	pc ch13
	pc ch36
	pc ch13
	pc ch28
	pc nl
	
	li $v0, 10
	syscall