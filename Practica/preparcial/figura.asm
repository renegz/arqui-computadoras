org 100h

section .text

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 25d ; Lineas a desplazar hacia arriba
MOV BH, 20h ; Color de fondo
MOV CH, 00d ; Fila inicial
MOV CL, 00d ; Columna inicial
MOV DH, 24d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 79d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 5d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 02d ; Fila inicial
MOV CL, 20d ; Columna inicial
MOV DH, 08d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 33d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 5d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 02d ; Fila inicial
MOV CL, 47d ; Columna inicial
MOV DH, 08d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 60d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 5d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 08d ; Fila inicial
MOV CL, 34d ; Columna inicial
MOV DH, 13d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 46d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h


MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 6d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 13d ; Fila inicial
MOV CL, 25d ; Columna inicial
MOV DH, 18d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 55d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 4d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 18d ; Fila inicial
MOV CL, 25d ; Columna inicial
MOV DH, 21d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 30d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h

MOV AH, 06H ; Mueve filas hacia arriba
MOV AL, 4d ; Lineas a desplazar hacia arriba
MOV BH, 01H ; Color de fondo
MOV CH, 18d ; Fila inicial
MOV CL, 50d ; Columna inicial
MOV DH, 21d ; Fila final (25 líneas, 0 basado, por lo que es 18h)
MOV DL, 55d ; Columna final (80 columnas, 0 basado, por lo que es 4Fh)

INT 10h




int 20h