# Assembly Exemplos
Códigos em Assembly prara estudar

# Introdução
Usando o TASM como Assembler (Montador)
```assembly

.MODEL SMALL    ; define o modelo de memoria a usar em nosso programa

.STACK          ; reserva espaço de memória para as instruções de programa na pilha

.CODE           ; define as instruções do programa, relacionado ao segmento de código

END             ; finaliza um programa assembly

```

## Exemplo 01
Usado para mudar o tamanho do curso. Porém tem algum erro.
````assembly

.MODEL SMALL        ; modelo de memória
.STACK              ; espaço de memória para instruções do programa na pilha
.CODE               ; as linhas seguintes são instruções do programa
    mov ah, 01h      ; move o valor 01h para o registrador ah
    mov cx, 07h      ; move o valor 07h para o registrador cx
    int 10h         ; interrupção 10h
    mov ah, 4ch      ; move o valor 4ch para o registrador ah
    int 21h         ; interrupção 21h
.DATA
x db 1
END                 ; finaliza o código do programa

````


