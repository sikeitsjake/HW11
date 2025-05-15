; Author: Jacob Folderauer
; Date:   5/13/2025
; Description:
; Class: UMBC CMSC 313
; Section: 0830

section .data
inputBuffer:
	db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A

hexChars:
	db '0123456789ABCDEF'

newline:
	db 0xA ; newline char '\n'

section .bss
outputBuffer:
	resb 80

section .text
global _start

_start:
	mov esi, inputBuffer ; pointer to input
	mov edi, outputBuffer ; pointer to output
	mov ecx, 8 ; length of bytes of the input

conversion_loop:
	; Load input byte
	mov al, [esi]
	mov bl, al

	; First half of the input byte
	shr al, 4
	mov dl, [hexChars + eax]
	mov [edi], dl
	inc edi
	
	; Second half of the input byte
	mov al, bl
	and al, 0Fh
	mov dl, [hexChars + eax]
	mov [edi], dl
	inc edi
	
	; If there is nothing left to convert, dont add a space
	dec ecx
	inc esi
	cmp ecx, 0
	je done_converting

	; Add a space if we are moving onto another byte
	mov byte [edi], ' '
	inc edi
	jmp conversion_loop

done_converting:
	; Add a newline to the output buffer
	mov byte [edi], 0xA
	inc edi	
	
	; System call to write outBuffer
	mov eax, 4
	mov ebx, 1
	mov ecx, outputBuffer
	mov edx, edi
	sub edx, outputBuffer
	int 0x80
	
	; System call to exit normally
	mov ebx, 0
	mov eax, 1
	int 0x80	
