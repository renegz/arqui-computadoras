org 100h

section .data
    msg1 db 'Para mostrar el rectangulo presione la tecla 1$', 0
    msg2 db 'Para mostrar el triangulo presione la tecla 2$', 0
    msg3 db 'Fin del programa$', 0

section .text

main:
    CALL IniciarModoTexto
    MOV BH, 0 ;pagina 0
    
    CALL ImprimirOpciones

    CALL EsperarTecla

    CMP AL, 31h ;ascci 1
    JE rectangulo
    CMP AL, 32h ; ascii 2
    JE triangulo

    INT 20h

IniciarModoTexto:
    MOV AH, 00h ;funcion que establece el modo texto
    MOV AL, 03h ;Establece modo texto 80x25
    int 10h ;Llama a la interrupcion del bios para cambiar el modo texto
    ret

IniciarModoGrafico:
    MOV AH, 00H ;modo grafico
    MOV AL, 12H ;vga 640x480
    INT 10H
    ret

ImprimirOpciones:
    MOV CH, 10 ;fila 10
    MOV CL, 25 ;columna 25

    CALL MoverCursor

    MOV AH, 09h
    MOV DX, msg1
    INT 21h

    MOV CH, 20 ;fila 20
    CALL MoverCursor
    MOV AH, 09h
    MOV DX, msg2
    INT 21h
    RET

MoverCursor:
    MOV AH, 02h ;funcion que mueve el cursor
    MOV DH, CH ;posiciona el cursor en la fila 10 (fila central) (Si se le pone h al valor no va tomar la fila sino que el valor hexa)
    MOV DL, CL ;posiciona el cursor en la columna 25 (columna central)
    INT 10h ;Llama a la interrupcion del bios para mover el cursor
    ret

CambiarPagina1:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 1 ;pagina 1, ya que ya estabamos usando la 0
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

CambiarPagina2:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 2 ;pagina 1, ya que ya estabamos usando la 0
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

CambiarPagina3:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 3 ;pagina 1, ya que ya estabamos usando la 0
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

EsperarTecla:
    MOV AH, 00h ;funcion que espera a que se presione una tecla
    INT 16h ;Llama a la interrupcion del bios para esperar a que se presione una tecla
    ret

rectangulo:
    CALL IniciarModoGrafico
    CALL CambiarPagina1
    MOV DX, 70d ;En la fila 70 (46 hexa)
    MOV CX, 90d ;En la columna 90 (8c hexa)

    CALL build_rectangulo

    
build_rectangulo:
    MOV AH, 0CH ;Peticion para escribir un punto
    MOV AL, 04H ;En color rojo
    MOV BH, 1 ;En la pagina 1
    INT 10H

    CMP cx, 190d
    je compare_rectangulo

    INC CX
    JMP build_rectangulo
    

compare_rectangulo:
    CMP dx, 120d
    je fin
    MOV CX, 90d ;En la columna 90 (8c hexa)
    inc DX
    JMP build_rectangulo



triangulo:
    CALL IniciarModoGrafico
    CALL CambiarPagina2
    MOV si, 90d
    MOV DX, 70d ;En la fila 70 (46 hexa)
    MOV CX, 90d ;En la columna 90 (8c hexa)

    CALL build_triangulo

    
build_triangulo:
    MOV AH, 0CH ;Peticion para escribir un punto
    MOV AL, 04H ;En color rojo
    MOV BH, 2 ;En la pagina 0
    INT 10H

    CMP cx, si
    je compare_triangulo

    INC CX
    JMP build_triangulo

compare_triangulo:
    CMP dx, 120d
    je fin
    MOV CX, 90d ;En la columna 90 (8c hexa)
    inc si
    inc DX
    JMP build_triangulo

fin:
    CALL EsperarTecla
    CALL IniciarModoTexto
    CALL CambiarPagina3

    MOV BH, 3 ;pagina 3
    MOV CH, 10 ;fila 10
    MOV CL, 25 ;columna 25
    CALL MoverCursor

    MOV AH, 09h
    MOV DX, msg3
    INT 21h

    INT 20h