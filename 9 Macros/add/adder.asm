;Definition of all macros

; 1 - Display info
%macro prompt 2
  mov eax, SYS_WRITE
  mov ebx, SYS_EXIT
  mov ecx, %1
  mov edx, %2
  int 0x80
%endmacro
; 2 - Read number from input
%macro acceptNumber 1
  mov eax, SYS_READ
  mov ebx, FILE_DESCRIPTOR
  mov ecx, %1
  mov edx, 10
  int 0x80
%endmacro

; 3 - Convert number to be operable by assembler
%macro convertToString 2
  mov %1, [%2]
  sub %1, '0'
%endmacro

; 4 - Add numbers
%macro sumNumbers 2
  add %1, %2
  add %1, '0'
  mov [sum], %1
%endmacro

section .data
  
  FILE_DESCRIPTOR EQU 1
  SYS_EXIT EQU 1
  SYS_READ EQU 3
  SYS_WRITE EQU 4

  NUM1_PROMPT DD "Enter Num 1: "
  NUM1_PROMPT_LEN EQU $ - NUM1_PROMPT
  
  NUM2_PROMPT DD "Enter Num 2: "
  NUM2_PROMPT_LEN EQU $ - NUM2_PROMPT

section .bss
  num1 RESW 2
  num2 RESW 2
  sum RESW 2

section .text
  global _start:
  _start:

  prompt NUM1_PROMPT, NUM1_PROMPT_LEN
  acceptNumber num1

  prompt NUM2_PROMPT, NUM2_PROMPT_LEN
  acceptNumber num2

  convertToString eax, num1
  convertToString ebx, num2

  sumNumbers eax, ebx

  prompt sum, 10
  
  exit:
  mov eax, SYS_EXIT
  int 0x80
