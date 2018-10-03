SYSTEM_READ equ 3
SYSTEM_WRITE equ 4
SYSTEM_IN equ 0
SYSTEM_OUT equ 1
SYSTEM_EXIT equ 1

%macro print_message 2
	mov edx, %2 ; length
	mov ecx, %1 ; Message
	mov ebx, SYSTEM_OUT
	mov eax, SYSTEM_WRITE
	int 80h	
%endmacro

%macro read_input 2
	mov eax, SYSTEM_READ
	mov ebx, SYSTEM_IN
	mov ecx, %1 ; variable
	mov edx, %2 ; length
	int 80h
%endmacro

section .data
	prompt db "Enter your name: "
	promptLen equ $-prompt
	helloMsg dq "Hello "
	helloMsgLen equ $-helloMsg
	
section .bss
	name resb 15 ; Reserve 15 bytes for name
	
section .text
	global _start
	
	_start:
		print_message prompt, promptLen ; Print prompt

		read_input name, 15 ; Read input
		
		print_message helloMsg, helloMsgLen ; Output hello message

		print_message name, 15 ; Output name
		
		mov eax, SYSTEM_EXIT
		int 80h