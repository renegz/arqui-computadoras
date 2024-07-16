org 100h

section .data ;.data es para definir variables
    msgMayor db 'El digito es mayor que 5$'
    msgMenor db 'El digito es menor que 5$'
    msgIgual db 'El digito es igual a 5$'
    msgFin db 'Fin del programa$'

section .text

main:
    CALL IniciarModoTexto

    MOV BH, 0 ;pagina 0 (seleccionamos la pagina 0 para centrar el cursor primero)

    CALL CentrarCursor

    CALL CompararNumero

    CALL EsperarTecla

    CALL CambiarPagina

    MOV BH, 1 ;pagina 1 (seleccionamos la pagina 1 en donde se centrara el cursor, ya que el cursor debe saber en que pagina se centrara)

    CALL CentrarCursor

    CALL ImprimirFin
    
    CALL EsperarTecla

    INT 20h

IniciarModoTexto:
    MOV AH, 00h ;funcion que establece el modo texto
    MOV AL, 03h ;Establece modo texto 80x25
    int 10h ;Llama a la interrupcion del bios para cambiar el modo texto
    ret

CentrarCursor:
    MOV AH, 02h ;funcion que mueve el cursor
    MOV DH, 10 ;posiciona el cursor en la fila 10 (fila central) (Si se le pone h al valor no va tomar la fila sino que el valor hexa)
    MOV DL, 25 ;posiciona el cursor en la columna 25 (columna central)
    INT 10h ;Llama a la interrupcion del bios para mover el cursor
    ret

CompararNumero:
    MOV AL, 5d ;carga el valor 5 en AL
    CMP AL, 5d ;compara el valor de AL con 5
    JA mayor ;si AL es mayor que 5 salta a la etiqueta mayor
    JB menor ;si AL es menor que 5 salta a la etiqueta menor
    JE igual ;si AL es igual a 5 salta a la etiqueta igual

    RET

mayor:
    MOV AH, 09h ;funcion que imprime un mensaje
    MOV DX, msgMayor ;direccion del mensaje a imprimir
    INT 21h 
    RET

menor:
    MOV AH, 09h 
    MOV DX, msgMenor 
    INT 21h 
    RET

igual:
    MOV AH, 09h 
    MOV DX, msgIgual 
    INT 21h 
    RET

EsperarTecla:
    MOV AH, 00h ;funcion que espera a que se presione una tecla
    INT 16h ;Llama a la interrupcion del bios para esperar a que se presione una tecla
    ret

CambiarPagina:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 1 ;pagina 1, ya que ya estabamos usando la 0
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

ImprimirFin:
    MOV AH, 09h 
    MOV DX, msgFin 
    INT 21h 
    RET