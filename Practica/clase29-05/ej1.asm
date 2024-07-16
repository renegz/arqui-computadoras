org 100h
section .text

    MOV AH, 0Eh ;funcion 0e
    MOV AL, 'A' ;caracter a imprimir
    MOV BH, 00H ;pagina
    MOV BL, 05H ;color magenta (no sirve)
    INT 10h ;activar interrupcion modo texto de video

    INT 20h