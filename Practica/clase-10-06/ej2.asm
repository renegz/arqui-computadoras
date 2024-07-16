
org 100h

section .text

MOV AH, 00H ;modo grafico
MOV AL, 12H ;vga 640x480
INT 10H

MOV AH, 0CH ;Peticion para una linea
MOV AL, 04H ;En color rojo
MOV BH, 00H ;En la pagina 0
MOV CX, 190h ;En la columna 400 (190 hexa)
MOV DX, 46H ;En la fila 70 (46 hexa)

CALL subrutine
CALL interrupcion

subrutine: ;subrutina que hace un bucle para decrementar cx e imprimir una fila
    INT 10H
    LOOP subrutine

interrupcion: ;subrutina que al presionar 'a' en el teclado hace que vuelva al modo texto
    MOV AH, 00H ;modo video para lectura del teclado
    INT 16h ;llama a rutina de la bios para teclado
    CMP AL, 'a' ;compara si la letra presionada sea a
    jne interrupcion ;si no es a vuelve a esperar que sea presionada
    MOV AH, 00H ;modo texto
    MOV AL, 03h ;resolucion 25x80
    INT 10h ;interrupcion modo texto
    int 20h ;llama a debug
