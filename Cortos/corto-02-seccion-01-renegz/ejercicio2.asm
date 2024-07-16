org 100h

section .text

main:

    ;Mover dato BC con direccionamiento absoluto a la direccion 200h y despues a un registro
    ;Se mueve a ax ya que despues se utilizara para una multiplicacion
    MOV byte[200h], 0BCh
    MOV AX, [200h]

    ;muevo el valor a multiplicar en BL
    MOV BL, 3d

    JMP subrutine

    INT 20h

subrutine:
    CALL multiplicacion
    ;Se compara el valor de la multiplicacion con FFFFh, si es menor se vuelve a multiplicar
    CMP AX, 0FFFFh
    JB subrutine

    ;Cuando sea mayor se manda el resultado a 0210h
    MOV word[210h], AX
    RET

multiplicacion:
    MUL BL
    RET