org 100h

section .text

main:
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

    INT 20h

IniciarModoGrafico:
    MOV AH, 0H ;funcion que establece el modo video
    mov AL, 12h ;640x480 pixeles
    INT 10H 
    RET

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