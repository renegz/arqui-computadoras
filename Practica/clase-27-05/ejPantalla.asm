org 100h

section .text
    MOV AH, 09H ;activamos funcion 09 (imprime en la misma posicion de la pagina)
    MOV AL, 41H ;queremos repetir letra a
    MOV BH, 00H ;en la primera pagina de pantalla (pagina 0)
    ;MOV BL, 72H ;en fondo blanco y frente verde     
    MOV BL, 1EH ;letra blanca y fondo azul
    MOV CX, 03H ;queremos repetir el caracter 3 veces

    INT 10H ;activar la interrumplcion 10 (modo texto de video)

    INT 20h ;interrupcion para terminar el programa