.MODEL small
.STACK 100h
.DATA
;--------------------------------------------------
;VARIÀVEIS
titulo DB 'ORDENACAO DE STRING PARA N NUMEROS',10,13, '$' 
        ; 10 = Line Feed = LF
        ; 13 = Carriage Return = CR
complemento DB ' Vetor(es) iniciais:   ',10,13, '$'
vetor  db '1','5','4','8','1','2','5','6', '9'
tam_Vetor EQU $-Vetor
pula_linha db 10,13,'$'
Ordenacao dB 'Vetores ordenados:   ',10,13,'$'
;---------------------------------------------------
.CODE
; Mensagens

;-----------------PROCEDIMENTO PARA EXIBIR VETOR----------
Exibir_vetor PROC NEAR
    push ax ;armazenando ax na pilha
    push dx ;armazenando dx na pilha
    

    mov dx, OFFSET pula_linha  ;Quebra de linha
    mov ah,09h
    int 21h

    mov dx, OFFSET VETOR       ;Imprime vetores
    mov ah,09h
    int 21h

    mov dx, OFFSET pula_linha  ;Quebra de linha
    mov ah,09h
    int 21h
    pop dx  ;recolhendo ax na pilha
    pop ax  ;recolhendo ax na pilha
    ret     ;retorna para o procedimento principal main
    
Exibir_vetor ENDP ;finaliza o procedimento

;-----------------FUNÇAO PARA ORDENAR VETORES-------------
Verifica_Vetores PROC NEAR

    push dx     ;armazenando dx na pilha
    push cx     ;armazenando cx na pilha
    push bx     ;armazenando bx na pilha
    push ax     ;armazenando ax na pilha
    mov cl, 0   ;valor inicial do primeiro laço para

        mov dx, OFFSET VETOR    ;Pegando a posição do inicial do vetor e armazenando em dx
        para1:                  ;primeiro para
            mov ch, 1           ;valor inicial do primeiro laço para
            para2:              ;segundo para
                dec ch          ;decrementa 1
                ;Leitura dos vetores vetor[ch] e vetor[cl] e armazenmento em al e ah, respect. 
                mov bh,0        
                mov bl,ch
                mov al, [vetor+bx]      ;3 
                mov bl,cl              
                mov ah, [vetor+bx]      
                    
            
                ; Verificando se vetor[ch] > vetor[cl]
                cmp al,ah 
                JA entao2
                JMP fim_se
                entao2:
                    ; Troca dos vetores. Armazena o maior vetor à direita    
                    mov bl, ch
                    mov  [vetor+bx],ah      
                    mov bl, cl              
                    mov [vetor+bx],al      
                fim_se:
                        
                    

                add ch,1
                add ch,1 
                cmp ch,tam_Vetor   ;Verifica se ch é maior que o tamanho do vetor             
                JE fim_para2        
                JMP para2                               
                fim_para2:         ;fim para2 
                    
        add cl,1
        cmp cl,tam_Vetor           ; Verifica se cl é maior que o tamanho do vetor   
        JE fim_para1               
        JMP para1
    fim_para1:          ;fim para2 
    pop ax   ;recolhendo ax na pilha
    pop bx   ;recolhendo bx na pilha
    pop cx   ;recolhendo cx na pilha
    pop dx   ;recolhendo dx na pilha
    ret      ;retorna para onde foi chamado
Verifica_Vetores ENDP


.startup ; Local onde o montador entennde o inicio do programa

;-----------------FUNÇAO PRINCIPAL--------------------------
main proc
    mov  ax,@data               
    mov  ds,ax                 ;Faz o montador apontar para o seguimento de dados DS
    
;-------------------INTERFACE INICIAL-----------------------   
    mov  ah,9                   
    mov  dx,OFFSET Titulo       
    int  21h                    ;Apresentada a primeira mensagem.
    ; imprime pula_linha
    mov dx, OFFSET pula_linha
    mov ah,09h
    int 21h
    mov dx,OFFSET Complemento 	
    mov  ah,9                  
    int  21h                    ;Apresenta a segunda mensagem

    ;Chamada de exibição do vetor inicial
    call exibir_vetor        
    ;Chama de exibição para ordenar o vetor
    call Verifica_Vetores

    mov dx, OFFSET pula_linha
    mov ah,09h
    int 21h
    mov dx,OFFSET Ordenacao 	; DX contém o offset da messagem
    mov  ah,9                  ;display "Hello, world"
    int  21h     

    ;Chamada de exibição do vetor ordenado
    call Exibir_vetor

 mov  ah,4ch                 
 int  21h                    ; Interrupção para finalização o programa 
main ENDP
END