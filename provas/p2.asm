.MODEL small
.STACK 100h
.DATA
a db 20
b db 10
c db ?
.CODE
.startup
mov ax,0
mov bx,0

mov cx,  [a]
mov dx,  [b]

mov ax, cx
add ax, dx
sub ax, 5

mov di, OFFSET c
mov [di], ax
mov dx, offset c
mov ah,09h
int 21h

   mov  ah,4ch                 ;DOS terminate program function
   int  21h                    ;terminate the program
   END