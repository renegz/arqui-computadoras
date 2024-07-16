ORG 100h ;No se suelen usar del 0 al 99 suelen estar reservados

SECTION .text

;Modo de direccionamiento inmediato

MOV AH, 12d ;Analogia a crear asignar un valor a una variable
MOV AL, 0FFh ;Se agrega el 0 para que se entiena que debe agarrar FF
MOV BH, 1001b ;Se pueorgden enviar binarios
MOV BL, "A" ;Se pueden enviar caracteres, pero aparece el codigo en ASCII

;Modo de direccionamiento por registro

MOV CH, AH ;Se puede asignar un valor de un registro a otro
MOV CL, AL
MOV DX, BX

;Modo de direccionamiento absoluto

MOV [200h], AH ;Se puede asignar un valor a una direccion de memoria
MOV AL, [200h]
MOV [210h], BX ;Se guarda siguiendo little endian
MOV BX, [210h] ;Se recupera siguiendo little endian

;Modo de direccionamiento indirecto 
;(como un puntero, se guarda en un registro la direccion de memoria)

MOV BP, 200h ;Se guarda la direccion de memoria
MOV BL, [BP] ;Corchetes se usa para acceder a la memoria

INT 20h