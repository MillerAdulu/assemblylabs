section .data
  FILE_DESCRIPTOR EQU 1
  SYS_EXIT EQU 1
  SYS_READ EQU 3
  SYS_WRITE EQU 4

  NUM1_PROMPT DD "Enter first number -> "
  NUM2_PROMPT DD "Enter second number -> "

section .bss

  num1 RESW 2
  num2 RESW 2
  product RESD 4

section .text
  global _start
  _start:

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, NUM1_PROMPT
  mov edx, 22
  int 0x80

  mov eax, SYS_READ
  mov ebx, SYS_EXIT
  mov ecx, num1
  mov edx, 2
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, NUM2_PROMPT
  mov edx, 23
  int 0x80

  mov eax, SYS_READ
  mov ebx, SYS_EXIT
  mov ecx, num2
  mov edx, 2
  int 0x80

  mov eax, [num2]
  sub eax, '0'

  mov edx, [num1]
  sub edx, '0'

  mul edx
  add eax, '0'

  mov [product], eax

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, product
  mov edx, 10
  int 0x80

  exit:
  mov eax, SYS_EXIT
  int 0x80
