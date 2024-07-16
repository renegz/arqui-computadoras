org 100h

section .data
    celcius dd 0.0
    factor dd 1.8
    suma dd 32.0

section .text


    XOR AX, AX
    mov eax, [200h] ;Se usa e200 antes de mover y ahi se coloca el numero a convertir
    ;para insertar en eax, se debe usar el conversor de decimal a hexadecimal con punto flotante y colocarlo de esa manera
    ;ej: 1 es igual a 3F800000 pero se debe colocar en la memoria como 0000803F (little-endian)
    ;Ingresar temperatura en celcius
    MOV [celcius], eax

    fld dword [celcius] ;fld -> carga en la pila de punto flotante
    fld dword [factor]
    fmul 
    fld dword [suma]
    fadd
    fstp dword [210h] ;fstp se extrae de la pila de punto flotante

    INT 20h
