org 100h

section .text
    MOV AH, 01h ;Desginar el tamaño del cursor
    MOV CH, 00H ;Linea inicial de rastreo
    MOV CL, 0Eh ;Linea final de rastreo
    int 10h ;Llama rutina de la bios

    int 20h