;                     definição do modelo desejado
; ************************************************************************
    DOSSEG
    .MODEL modelo
;                  definição da bae numérica desejada
; ************************************************************************
    [.RADIX base]
;                   definição do segmento de pilha
; ************************************************************************
    .STACK [tamanho]
;                 área de definição de equivalências
; ************************************************************************
                                    ; equivalências
;                   criação do segmento de dados
    .DATA
                                    ; variáveis
;                    início do segmento de código
; ************************************************************************
    .CODE
;                       procedimento principal
; ************************************************************************
Principal PROC NEAR                 ; inicio do procedimento principal
    MOV     AX, @DATA               ; instruções para DS e ES
    MOV     DS, AX                  ; apontem para a área de
    MOV     ES, AX                  ; dados criada

                                    ; corpo do programa principal

    MOV     AH, 4Ch                 ; função para termino de programa
    MOV     21h                     ; através da INT 21h
Principal ENDP                      ; final do procedimento principal
    END     Principal               ; final do programa