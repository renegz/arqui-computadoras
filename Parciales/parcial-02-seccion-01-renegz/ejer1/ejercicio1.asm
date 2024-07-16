org 100h

section .text
;dividir 27 por 4
main:
    XOR ax, ax ;se limpian registros
    XOR bx, bx
    ;se guardan los valores a dividir 
    MOV al, 27d 
    MOV bl, 4d
    div bl
    MOV BP, 200h ;Se guarda la direccion de memoria en bp
    MOV [bp], AL ;se guarda el resultawdo de la division en bp

    call division ;llamo la funcion que itera

    INT 20h

division:
    mov ah, 00h ;Limpio ah para que haga bien la division
    div bl ;va dividiendo los resultados entre 4
    INC bp ;incrementa bp para guardar en la siguiente direccion de memoria
    MOV [bp], AL ;muevo el nuevo resultado
    cmp AL, 4 ;comparo si la respuesta es menor o igual a 4, si lo es salta a la subrutina end, sino sigue el bucle
    jbe end
    jmp division


end:
    ;imprime fin
    MOV byte[220h], 'f'
    MOV byte[221h], 'i'
    MOV byte[222h], 'n'
    RET
    
