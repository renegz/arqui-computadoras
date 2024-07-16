ORG 100h

SECTION .text

;Escribir mi carnet en direccion de memoria 200
;carnet: 00077321

;Modo dir inmediato
MOV AL, 00h
MOV AH, 01h
MOV BH, 02h
MOV BL, 03h
MOV CL, 07h

;Por registro
MOV CH, CL

;Por absoluto
MOV [200h], AL
MOV [201h], AL
MOV [202h], AL
MOV [203h], CL
MOV [204h], CH
MOV [205h], BL
MOV [206h], BH

;Modo indirecto
MOV BP, 207h
MOV [BP], AH










INT 20h