ORG 100h
section .text
	
MOV byte [0200h], 69h   ; 'i'
MOV byte [0201h], 70h   ; 'p'
MOV byte [0202h], 6Dh   ; 'm'
MOV byte [0203h], 6Fh   ; 'o'
MOV byte [0204h], 68h   ; 'h'
MOV byte [0205h], 43h   ; 'C'


	
	MOV BP, 0200h; point to the first character

	MOV AH, 09h; print string
	
	MOV BH, 00h; page number
	
	MOV BL, 49h; attribute
	MOV CX, 06h; string length
	
	print:
		MOV AL, [BP]
		INC BP
		INT 10h
		LOOP print
	
	INT 20h