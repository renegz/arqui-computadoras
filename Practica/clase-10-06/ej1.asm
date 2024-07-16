org 100h

section .text

MOV AH, 00H ;modo grafico
MOV AL, 12H ;vga 640x480
INT 10H

MOV AH, 0CH ;Peticion para escribir un punto
MOV AL, 04H ;En color rojo
MOV BH, 00H ;En la pagina 0
MOV CX, 8CH ;En la columna 140 (8c hexa)
MOV DX, 46H ;En la fila 70 (46 hexa)
INT 10H

INT 20h