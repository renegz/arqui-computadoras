org 100h

section .data
    numero1 dd 0.0
    numero2 dd 0.0
    opcion dd 0.0

section .text

    XOR AX, AX
    mov eax, [200h] ;Se coloca el numero 1 en little endian, y se obtiene
    mov [numero1], eax
    mov ebx, [210h] ;Se coloca el numero 2 en little endian, y se obtiene
    mov [numero2], ebx

    mov cx, [220h] ;Se guarda lo que este en 220h (lo ingresa el usuario puede ser 1 o 2)
    mov [opcion], cx

    CMP byte[opcion], 1 ;Compara si la opcion es 1
    je division
    CMP byte[opcion], 2 ;Compara si la opcion es 2
    je suma
    CMP byte[opcion], 2 ;Compara si la opcion es otra
    jg otro

    INT 20h

suma:
    fld dword [numero1] ;fld -> carga en la pila de punto flotante
    fld dword [numero2]
    fadd
    fstp dword [240h] ;fstp -> guarda el valor en la direccion de memoria
    INT 20h

division:
    fld dword [numero1]
    fld dword [numero2]
    fdiv
    fstp dword [230h]
    INT 20h

otro:
    MOV byte[250h], 'f'
    MOV byte[251h], 'i'
    MOV byte[252h], 'n'
    INT 20h