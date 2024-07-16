;René Alejandro Guzmán Interiano - 00077321
;David Alberto Diaz Sanchez - 00060021
org 100h

section .text

    XOR AX,AX
    CALL limpiar_pantalla
    CALL mover_cursor
    CALL imprimir_nombre
    CALL mover_cursor_medio
    CALL imprimir_apellido


    INT 20h

limpiar_pantalla:
; mover filas
    MOV AH, 06h
    MOV AL, 00h

    MOV BH, 47h

    MOV CH, 00h
    MOV CL, 00h

    MOV DH, 24h
    MOV DL, 79h

    INT 10h
    RET

imprimir_nombre:
    MOV AH, 0Eh
    MOV AL, 'R'
    INT 10h

    MOV AL, 'e'
    INT 10h

    MOV AL, 'n'
    INT 10h

    MOV AL, 'e'
    INT 10h

    RET

mover_cursor:
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 0
    MOV DL, 39
    INT 10h
    RET

mover_cursor_medio:
    MOV AH, 02h
    MOV BH, 00h
    MOV DH, 12
    MOV DL, 39
    INT 10h
    RET

imprimir_apellido:
    MOV AH, 0Eh
    MOV AL, 'S'
    INT 10h

    MOV AL, 'a'
    INT 10h

    MOV AL, 'n'
    INT 10h

    MOV AL, 'c'
    INT 10h

    MOV AL, 'h'
    INT 10h

    MOV AL, 'e'
    INT 10h

    MOV AL, 'z'
    INT 10h

    RET