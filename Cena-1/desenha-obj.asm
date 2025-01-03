; *********************************************************************************
; * IST-UL | UAlg
; * Modulo:    lab4-objeto.asm
; * Descrição: Este programa ilustra o desenho de um objeto do ecrã, em que os pixels
; *            são definidos por uma tabela.
; *			A zona de dados coloca-se tipicamente primeiro, para ser mais visível,
; *			mas o código tem de começar no endereço 0000H. As diretivas PLACE
; *			permitem esta inversão da ordem de dados e código no programa face aos endereços
; *********************************************************************************

; *********************************************************************************
; * Constantes
; *********************************************************************************
COMANDOS				EQU	6000H				; endereço de base dos comandos do MediaCenter

APAGA_PIXEIS_ECRA		EQU COMANDOS + 00H		; Apaga todos os pixeis do ecrã especificado
SELECIONA_ECRA			EQU COMANDOS + 04H		; Seleciona o ecrã especificado
MOSTRA_ECRA				EQU COMANDOS + 06H		; Mostra o ecrã especificado
ESCONDE_ECRA			EQU COMANDOS + 08H		; Esconde o ecrã especificado
DEFINE_LINHA			EQU COMANDOS + 0AH		; endereço do comando para definir a linha
DEFINE_COLUNA			EQU COMANDOS + 0CH		; endereço do comando para definir a coluna
DEFINE_PIXEL			EQU COMANDOS + 12H		; endereço do comando para escrever um pixel
APAGA_AVISO				EQU COMANDOS + 40H		; endereço do comando para apagar o aviso de nenhum cenário selecionado
APAGA_ECRÃ				EQU COMANDOS + 02H		; endereço do comando para apagar todos os pixels já desenhados
SELECIONA_BG			EQU COMANDOS + 42H		; endereço do comando para selecionar uma imagem de fundo
INICIA_SOM				EQU COMANDOS + 5AH		; endereço do comando para reproduzir som
PARA_SOM				EQU COMANDOS + 66H		; endereço do comando para parar som
PAUSA_SOM 				EQU COMANDOS + 5EH		; endereço do comando para pausar som
CONTINUA_SOM			EQU COMANDOS + 60H		; endereço do comando para continuar som

NUM_ECRAS				EQU 6					; número de ecrãs 0-7 (8 no total)

; #######################################################################
; # ZONA DE DADOS 
; #######################################################################
	PLACE		0100H				

giftbox:					; tabela que define o objeto giftbox (cor, largura, pixels)
	WORD  6, 8, 11, 15 		; linha,coluna,largura,altura
	WORD  0000H,0FC22H,0FC22H, 0000H, 0000H, 0000H, 0000H, 0000H,0FC22H,0FC22H, 0000H
	WORD  0FC22H,0FE12H,0FE12H,0FE12H, 0000H, 0000H, 0000H,0FC22H,0FE12H,0FE12H,0FC22H
	WORD  0FC22H,0FE12H,0FE12H,0FE12H,0FC22H,0FC22H,0FC22H,0FE12H,0FE12H,0FE12H,0FC22H
	WORD  0000H,0FC22H,0FE12H,0FE12H,0FC22H,0FE12H,0FC22H,0FE12H,0FE12H,0FC22H, 0000H
	WORD  0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H
	WORD  0F353H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F353H
	WORD  0F353H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F462H,0F353H
	WORD  0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H,0F353H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F462H,0F462H,0FC22H,0FE12H,0FC22H,0F462H,0F462H,0F353H, 0000H
	WORD  0000H,0F353H,0F353H,0F353H,0FC22H,0FE12H,0FC22H,0F353H,0F353H,0F353H, 0000H
	
pai_natal:					; tabela que define o objeto pai natal (cor, largura, pixels)
	WORD  4, 26, 13, 17 	; linha,coluna,largura,altura
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H,0FBBBH,0FFFFH, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H,0FC22H,0FC22H,0FC22H,0FFFFH,0FFFFH, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0FC22H,0FC22H,0FE12H,0FE12H,0FE12H,0FC22H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0FC22H,0FC22H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FC22H, 0000H, 0000H
	WORD  0000H,0FC22H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FC22H, 0000H
	WORD  0FC22H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FE12H,0FC22H
	WORD  0FE12H,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FE12H
	WORD  0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FFFFH,0FFFFH
	WORD  0000H,0FFFFH,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FFFFH, 0000H
	WORD  0000H,0FEA7H,0FEA7H,0FEA7H,0F000H,0FEA7H,0FEA7H,0FEA7H,0F000H,0FEA7H,0FEA7H,0FEA7H, 0000H
	WORD  0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H
	WORD  0000H,0FFFFH,0FFFFH,0FFFFH,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FEA7H,0FFFFH,0FFFFH,0FFFFH, 0000H
	WORD  0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FEA7H,0FEA7H,0FEA7H,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H
	WORD  0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H
	WORD  0000H,0FBBBH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FBBBH, 0000H
	WORD  0000H, 0000H,0FBBBH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FBBBH, 0000H, 0000H
	WORD  0000H, 0000H, 0000H,0FBBBH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FBBBH, 0000H, 0000H, 0000H

arvore:					; tabela que define o objeto pai natal (cor, largura, pixels)
	WORD  6, 44, 13, 16 ; linha,coluna,largura,altura
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H,0F562H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H,0F562H,0F793H,0F562H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H,0F785H,0F793H,0F785H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0F562H,0F793H,0F793H,0F793H,0F562H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0F785H,0F793H,0F793H,0F793H,0F785H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H,0F562H,0F793H,0F793H,0F793H,0F793H,0F793H,0F562H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H,0F785H,0F793H,0F793H,0F793H,0F793H,0F793H,0F785H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0F562H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F562H, 0000H, 0000H
	WORD  0000H, 0000H,0F785H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F785H, 0000H, 0000H
	WORD  0000H,0F562H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F562H, 0000H
	WORD  0000H,0F785H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F785H, 0000H
	WORD  0F562H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F793H,0F562H
	WORD  0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H,0F562H
	WORD  0000H, 0000H, 0000H, 0000H,0F941H,0F953H,0F953H,0F953H,0F941H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0F941H,0F941H,0F941H,0F941H,0F941H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H

luzes1:					; tabela que define o objeto luzes da árvore 1 (cor, largura, pixels)
	WORD  7, 47, 8, 11 	; linha,coluna,largura,altura
	WORD  0000H, 0000H, 0000H,0FAE1H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0FE12H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0FFC0H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0FF70H, 0000H, 0000H,0FAE1H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0FF70H, 0000H,0FFC0H, 0000H, 0000H,0FE12H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0FE12H, 0000H, 0000H, 0000H, 0000H,0FAE1H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H,0FFC0H, 0000H, 0000H, 0000H,0FF70H

luzes2:					; tabela que define o objeto luzes da árvore 2 (cor, largura, pixels)
	WORD  7, 47, 8, 11 	; linha,coluna,largura,altura
	WORD  0000H, 0000H, 0000H,0FE12H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0FAE1H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H,0F903H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H,0FFC0H, 0000H, 0000H,0FE12H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0FFC0H, 0000H,0F903H, 0000H, 0000H,0FAE1H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0FAE1H, 0000H, 0000H, 0000H, 0000H,0FE12H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H,0F903H, 0000H, 0000H, 0000H,0FFC0H

merry_xmas:					; tabela que define o objeto que contém o texto merry xmas (cor, largura, pixels)
	WORD  24, 9, 49, 5 		; linha,coluna,largura,altura
	WORD  0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH,0FFFFH, 0000H, 0000H, 0000H,0FFFFH,0FFFFH,0FFFFH
	WORD  0FFFFH,0FFFFH, 0000H,0FFFFH,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH, 0000H,0FFFFH,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H
	WORD  0FFFFH, 0000H,0FFFFH, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H, 0000H,0FFFFH,0FFFFH, 0000H
	WORD  0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0FFFFH
	WORD  0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H, 0000H,0FFFFH, 0000H,0FFFFH, 0000H, 0000H,0FFFFH, 0000H,0FFFFH,0FFFFH,0FFFFH, 0000H

neve1:					; tabela que define o objeto neve 1 (cor, largura, pixels)
	WORD  0, 0, 64, 32 	; linha,coluna,largura,altura
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H, 0000H
	WORD  0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H, 0000H, 0000H,0F444H, 0000H, 0000H, 0000H, 0000H,0FFFFH, 0000H, 0000H

; *********************************************************************************
; * Código
; *********************************************************************************
	PLACE   0				; o código tem de começar em 0000H
inicio:
    MOV [APAGA_AVISO], R1	; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)
    MOV [APAGA_ECRÃ], R1	; apaga todos os pixels já desenhados (o valor de R1 não é relevante)
	MOV	R1, 0				; cenário de fundo número 0
    MOV [SELECIONA_BG], R1	; seleciona o cenário de fundo
	MOV [INICIA_SOM], R1	; reproduz som
	MOV	R4, giftbox			; endereço da tabela que define o primeiro objeto
	MOV R7, NUM_ECRAS		; num total de ecrãs a desenhar (NUM_ECRAS + 1)
     
posição_objeto:
    MOV R1, [R4]			; obtém a linha do objeto, será decrementada para controlo de fluxo
	MOV R8, R1				; guarda LINHA do objeto
	ADD R4, 2				; avança para a 2ª palavra da tabela que define o objeto
	
	MOV R2, [R4]			; obtém a coluna do objeto, será decrementada para controlo de fluxo
	MOV R9, R2				; guarda coluna do objeto
	ADD R4, 2				; avança para a 3ª palavra da tabela que define o objeto
	
	MOV R5, [R4]			; obtém a largura do objeto - será decrementada para controlo de fluxo
	MOV R10, R5				; guarda largura
	ADD R4, 2				; avança para a 4ª palavra da tabela que define o objeto
	
	MOV R6, [R4]			; obtém a altura do objeto
	ADD R4, 2				; avança para a próxima palavra da tabela que define o objeto para obter a cor do pixel

seleciona_ecra:
	MOV [SELECIONA_ECRA], R7	; seleciona ecrã

desenha_linhas:       		; desenha cada linha do objeto
	MOV R2, R9				; reinicia a coluna para cada linha

desenha_pixels:       		; desenha os pixels do objeto a partir da tabela
	MOV	R3, [R4]			; obtém a cor do próximo pixel do objeto
	MOV [DEFINE_LINHA], R1	; seleciona a linha
	MOV [DEFINE_COLUNA], R2	; seleciona a coluna
	MOV [DEFINE_PIXEL], R3	; altera a cor do pixel na linha e coluna selecionadas
	ADD	R4, 2				; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
    ADD R2, 1               ; próxima coluna
    SUB R5, 1				; menos uma coluna para tratar
    JNZ desenha_pixels      ; continua até percorrer toda a largura do objeto

	ADD R1, 1				; próxima linha
	MOV R5, R10				; reinicia a largura do objeto
	SUB R6, 1				; menos uma linha para tratar
	JNZ desenha_linhas		; continua até percorrer todas as linhas
	
	SUB R7, 1				; menos um ecrã para desenhar
	JNN posição_objeto		; desenha próximo ecrã se R7 (num do ecrã) não for negativo (0-7)
	MOV [PARA_SOM], R1		; para som

fim:
    JMP fim                 ; termina programa