org 100h

section .data

    nombre db 'Rene$' ;se debe poner el signo de dolar
    colores db 1eh, 2eh, 3eh, 4eh

section .text

main:

    ;Registro SI es el contador para el arreglo de caracteres
    MOV si, 0
    MOV DL, 25

    CALL IniciarModoTexto

    CALL iterador

    INT 20h

iterador:
        CALL MoverCursor
        MOV AH, 09h 
        MOV AL, [nombre + si] ;cargamos el caracter en AL
        MOV BL, [colores + si] ;cargamos el color en BL
        MOV CX, 1 ;lo imprime una vez

        INC SI ;incrementamos el contador

        CMP AL, '$' ;comparamos si llegamos al final del arreglo
        JE fin ;si es igual a 0, salimos del ciclo
    
        INT 10h ;imprimimos el caracter en pantalla
        JMP iterador ;saltamos al iterador

fin:
    CALL EsperarTecla ;esperamos a que se presione una tecla
    INT 20h ;salimos del programa

MoverCursor:
    MOV AH, 02h ;funcion que mueve el cursor
    MOV BH, 0 ;pagina 0
    MOV DH, 10 ;posiciona el cursor en la fila 10 (fila central) (Si se le pone h al valor no va tomar la fila sino que el valor hexa)
    INC DL ;posiciona el cursor en la columna 25 (columna central)
    INT 10h ;Llama a la interrupcion del bios para mover el cursor
    ret

EsperarTecla:
    MOV AH, 00h ;funcion que espera a que se presione una tecla
    INT 16h ;Llama a la interrupcion del bios para esperar a que se presione una tecla
    ret

IniciarModoTexto:
    MOV AH, 00h ;funcion que establece el modo texto
    MOV AL, 03h ;Establece modo texto 80x25
    int 10h ;Llama a la interrupcion del bios para cambiar el modo texto
    ret