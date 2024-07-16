org 100h

section .text
    ;Se corre el programa y se presiona una shit + una tecla
    MOV AH, 00
    INT 16h
    MOV [0200h], AL
    INT 20h