org 200h

section .text
    main:
    xor ax, ax
    MOV AH, 02h ;funcion que coloca en al el estado de las teclas shift, ctrl, alt
    INT 16h ;interrupcion de teclado
    CMP AL, 01 ;compara si la tecla shift esta presionada
    JNE yes ;si no esta presionada salta a la direccion 0100h
    INT 20h     

yes:
    mov bh, 1
    INT 20h