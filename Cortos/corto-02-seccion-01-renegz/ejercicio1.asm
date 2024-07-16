org 100h

section .text

main:
    ;Direccionamiento inmediato hacia los registros
    MOV AL, 10d
    MOV BL, 4d

    ;Utilizando direccionamiento por registro con uno de los datos anteriores
    MOV AH, BL

    ;Resta sin acarreo
    SUB AL, BL

    ;Mandar de manera indirecta hacia 0210h
    MOV BP, 210h
    MOV [BP], AL

    CMP AL, 7d
    JB end

    INT 20h

end:
    MOV byte[220h], 'f'
    MOV byte[221h], 'i'
    MOV byte[222h], 'n'
    RET