org 100h

section .data
    msg1 db 'Parcial final de arquitectura$', 0
    msg2 db 'Para mostrar el triangulo presione la tecla 1$', 0
    msg3 db 'Para mostrar la figura presione la tecla 2$', 0
    msg4 db 'Para salir presione 3$', 0
    msg5 db 'RRene Alejandro Guzman Interiano - 00077321$', 0
    msgTriangulo db 'Ingresaste la opcion del triangulo$', 0
    msgFigura db 'Ingresaste la opcion de la figura$', 0
    msgFin db 'Fin del programa$', 0

section .text

main:
    CALL IniciarModoTexto
    MOV BH, 0 ;pagina 0
    
    CALL ImprimirOpciones

    CALL EsperarTecla

    ;Comparaciones luego de esperar la tecla para saber que funcion ejecutar
    CMP AL, 31h ;ascci 1
    JE setupTriangulo
    CMP AL, 32h ;ascci 2
    JE setupFigura
    CMP AL, 33h ;ascci 3
    JE salir

    JMP main

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
    MOV CH, 1d ;fila 1
    MOV CL, 25d ;columna 25

    CALL MoverCursor

    MOV AH, 09h
    MOV DX, msg1 ;Funcion para imprimir un mensaje
    INT 21h

    MOV CH, 9d ;fila 9
    CALL MoverCursor
    MOV AH, 09h
    MOV DX, msg2
    INT 21h

    MOV CH, 12d ;fila 12
    CALL MoverCursor
    MOV AH, 09h
    MOV DX, msg3
    INT 21h

    MOV CH, 15d ;fila 15
    CALL MoverCursor
    MOV AH, 09h
    MOV DX, msg4
    INT 21h

    MOV CH, 25d ;fila 25
    CALL MoverCursor
    MOV AH, 09h
    MOV DX, msg5
    INT 21h

    RET

MoverCursor:
    MOV AH, 02h ;funcion que mueve el cursor
    MOV DH, CH ;posiciona el cursor en la fila que esta en CH
    MOV DL, CL ;posiciona el cursor en la columna en CL
    INT 10h ;Llama a la interrupcion del bios para mover el cursor
    ret

CambiarPagina1:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 1 ;pagina 1, ya que ya estabamos usando la 0
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

CambiarPagina2:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 2 ;pagina 2
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

CambiarPagina3:
    MOV AH, 05h ;funcion que cambia de pagina en dosbox
    MOV AL, 3 ;pagina 3
    INT 10h ;Llama a la interrupcion del bios para cambiar de pagina
    ret

EsperarTecla:
    MOV AH, 00h ;funcion que espera a que se presione una tecla
    INT 16h ;Llama a la interrupcion del bios para esperar a que se presione una tecla
    ret

setupTriangulo:
    MOV CX, 200d ;columna inicial para cara pixel 230
    MOV DX, 200d ;fila inicial para cara pixel 200
    MOV SI, 200d ;variable para limite izquierdo de las columna
    MOV di, 290d ;variable para limite derecho de las columna
    CALL IniciarModoGrafico
    CALL CambiarPagina1 ;cambio de pagina a la 1
    CALL triangulo
    RET

triangulo:
    
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 1h ;Página 1 para dibujar
    INT 10H

    inc cx ;Incremento la columna para pintar una linea

    CMP cx, di
    jne triangulo ;Comparo hasta que pinte la linea hasta el limite sp

    dec di ;decremento el limite derecho
    inc si ;incremento el limite izquierdo
    MOV cx, si ;coloco el valor del limite izquierdo en cx para reiniciarlo en el nuevo limite
    DEC dx ;Decremento la fila

    CMP si, di ;Comparo si el limite izquierdo es igual al derecho
    JNE triangulo

    CALL bucleEsperarS
    
bucleEsperarS:
    CALL EsperarTecla
    CMP AL, 's' ;espera a que se presione la tecla s 
    jne bucleEsperarS ;si se presiona s se regresa al menu principal
    JMP main

salir:
    CALL IniciarModoTexto
    CALL CambiarPagina3

    MOV BH, 3 ;pagina 3
    MOV CH, 14d ;fila 14
    MOV CL, 25d ;columna 25
    CALL MoverCursor

    MOV AH, 09h
    MOV DX, msgFin
    INT 21h

    INT 20h

setupFigura:
    CALL IniciarModoGrafico
    CALL CambiarPagina2 ;cambio de pagina a la 2
    CALL figura
    RET

figura:
    CALL IniciarModoGrafico
    CALL setupCara
    CALL Cara
    CALL setupOjoIzquierdo
    CALL OjoIzquierdo
    CALL setupOjoDerecho
    CALL OjoDerecho
    CALL setupOrejaIzquierda
    CALL OrejaIzquierda
    CALL setupOrejaDerecha
    CALL OrejaDerecha
    CALL setupBigoteIzqArriba
    CALL BigotesIzq
    CALL setupBigoteIzqAbajo
    CALL BigotesIzq
    CALL setupBigoteDerArriba
    CALL BigotesDer
    CALL setupBigoteDerAbajo
    CALL BigotesDer
    CALL setupNariz
    CALL Nariz

    CALL bucleEsperarS

setupCara:
    MOV SI, 230d ;columna inicial para cara pixel 230
    MOV DI, 200d ;fila inicial para cara pixel 200
    RET

Cara:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 0h ;Página 0
    MOV CX, SI ;Columna
    MOV DX, DI  ;Fila
    INT 10H

    INC SI ;Incrementar columna
    CMP SI, 390d ;Si la columna no es igual a 390
    JNE Cara ;Volver a encender pixel hasta que termine de pintar la fila

    MOV SI, 230d ;Reiniciar columna

    INC DI ;Incrementar fila
    CMP DI, 300d ;Si la fila no es igual a 300 salta de fila
    JNE Cara ;Volver a pintar

    RET

setupOjoIzquierdo:
    MOV SI, 260d ;columna inicial para ojo izquierdo pixel 230
    MOV DI, 230d ;fila inicial para ojo izquierdo pixel 200
    RET

OjoIzquierdo:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 000h ;Color negro
    MOV BH, 0h ;Página 0
    MOV CX, SI ;Columna
    MOV DX, DI  ;Fila
    INT 10H

    INC SI ;Incrementar columna
    CMP SI, 270d ;Si la columna no es igual a 390
    JNE OjoIzquierdo ;Volver a encender pixel hasta que termine de pintar la fila

    MOV SI, 260d ;Reiniciar columna

    INC DI ;Incrementar fila
    CMP DI, 240d ;Si la fila no es igual a 300 salta de fila
    JNE OjoIzquierdo ;Volver a pintar

    RET

setupOjoDerecho:
    MOV SI, 350d ;columna inicial para ojo izquierdo pixel 230
    MOV DI, 230d ;fila inicial para ojo izquierdo pixel 200
    RET

OjoDerecho:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 000h ;Color negro
    MOV BH, 0h ;Página 0
    MOV CX, SI ;Columna
    MOV DX, DI  ;Fila
    INT 10H

    INC SI ;Incrementar columna
    CMP SI, 360d ;Si la columna no es igual a 390
    JNE OjoDerecho ;Volver a encender pixel hasta que termine de pintar la fila

    MOV SI, 350d ;Reiniciar columna

    INC DI ;Incrementar fila
    CMP DI, 240d ;Si la fila no es igual a 300 salta de fila
    JNE OjoDerecho ;Volver a pintar

    RET

setupOrejaIzquierda:
    MOV CX, 230d ;columna inicial para cara pixel 230
    MOV DX, 200d ;fila inicial para cara pixel 200
    MOV SI, 230d ;variable para limite izquierdo de las columna
    MOV di, 260d ;variable para limite derecho de las columna
    RET

OrejaIzquierda:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 0h ;Página 0
    INT 10H

    inc cx ;Incremento la columna para pintar una linea

    CMP cx, di
    jne OrejaIzquierda ;Comparo hasta que pinte la linea hasta el limite sp

    dec di ;decremento el limite derecho
    inc si ;incremento el limite izquierdo
    MOV cx, si ;coloco el valor del limite izquierdo en cx para reiniciarlo en el nuevo limite
    DEC dx ;Decremento la fila

    CMP si, di ;Comparo si el limite izquierdo es igual al derecho
    JNE OrejaIzquierda

    RET

setupOrejaDerecha:
    MOV CX, 360d ;columna inicial para cara pixel 230
    MOV DX, 200d ;fila inicial para cara pixel 200
    MOV SI, 360d ;variable para limite izquierdo de las columna
    MOV di, 390d ;variable para limite derecho de las columna
    RET

OrejaDerecha:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 0h ;Página 0
    INT 10H

    inc cx ;Incremento la columna para pintar una linea

    CMP cx, di
    jne OrejaIzquierda ;Comparo hasta que pinte la linea hasta el limite sp

    dec di ;decremento el limite derecho
    inc si ;incremento el limite izquierdo
    MOV cx, si ;coloco el valor del limite izquierdo en cx para reiniciarlo en el nuevo limite
    DEC dx ;Decremento la fila

    CMP si, di ;Comparo si el limite izquierdo es igual al derecho
    JNE OrejaIzquierda

    RET

setupBigoteIzqArriba:
    MOV CX, 229d ;columna inicial para cara pixel 230
    MOV DX, 240d ;fila inicial para cara pixel 200
    MOV SI, 200d ;variable para limite izquierdo de las columna
    
    RET

setupBigoteIzqAbajo:
    MOV CX, 229d ;columna inicial para cara pixel 230
    MOV DX, 270d ;fila inicial para cara pixel 200
    MOV SI, 200d ;variable para limite izquierdo de las columna
    
    RET

BigotesIzq:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 0h ;Página 0
    INT 10H

    DEC CX

    CMP CX, SI
    JNE BigotesIzq

    RET 
    
setupBigoteDerArriba:
    MOV CX, 390d ;columna inicial para cara pixel 230
    MOV DX, 240d ;fila inicial para cara pixel 200
    MOV SI, 420d ;variable para limite izquierdo de las columna
    
    RET

setupBigoteDerAbajo:
    MOV CX, 390d ;columna inicial para cara pixel 230
    MOV DX, 270d ;fila inicial para cara pixel 200
    MOV SI, 420d ;variable para limite izquierdo de las columna
    
    RET

BigotesDer:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 0ffh ;Color blanco
    MOV BH, 0h ;Página 0
    INT 10H

    INC CX

    CMP CX, SI
    JNE BigotesDer

    RET 

setupNariz:
    MOV CX, 295d ;columna inicial para cara pixel 230
    MOV DX, 250d ;fila inicial para cara pixel 200
    MOV SI, 295d ;variable para limite izquierdo de las columna
    MOV di, 325d ;variable para limite derecho de las columna
    RET

Nariz:
    MOV AH, 0CH ;Para dibujar un pixel
    MOV AL, 000h ;Color blanco
    MOV BH, 0h ;Página 0
    INT 10H

    inc cx ;Incremento la columna para pintar una linea

    CMP cx, di
    jne Nariz ;Comparo hasta que pinte la linea hasta el limite sp

    dec di ;decremento el limite derecho
    inc si ;incremento el limite izquierdo
    MOV cx, si ;coloco el valor del limite izquierdo en cx para reiniciarlo en el nuevo limite
    INC dx ;Incremento la fila

    CMP si, di ;Comparo si el limite izquierdo es igual al derecho
    JNE Nariz

    RET