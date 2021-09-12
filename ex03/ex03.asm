.MODEL SMALL
.STACK
.CODE
        add x, 8        ; x = x + 8
        mov DX, x       ; DX = x
        add DX, y       ; DX = DX + y = x + Y
        mov soma, DX    ; soma = DX
        sub x, 3        ; x = x - 3
        mov DX, x       ; Dx = x
        sub DX, y       ; DX = DX - y = x - Y
        mov subt, DX    ; subt = DX = x - y
.DATA
x       dw      5
y       dw      10
soma    dw      ?
subt    dw      ?
END
