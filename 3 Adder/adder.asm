section .data
  SYS_EXIT EQU 1
  SYS_READ EQU 3
  SYS_WRITE EQU 4

  NUM1_PROMPT DD "Enter Num 1: "
  NUM2_PROMPT DD "Enter Num 2: "
  
section .bss

  num1 RESW 2
  num2 RESW 2
  sum RESW 2

section .text
  global _start
  _start:

  mov eax, SYS_WRITE
  mov ebx, SYS_EXIT
  mov ecx, NUM1_PROMPT
  mov edx, 10
  int 0x80

  mov eax, SYS_READ
  mov ebx, SYS_EXIT
  mov ecx, num1
  mov edx, 10
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, SYS_EXIT
  mov ecx, NUM2_PROMPT
  mov edx, 10
  int 0x80

  mov eax, SYS_READ
  mov ebx, SYS_EXIT
  mov ecx, num2
  mov edx, 10
  int 0x80

  mov eax, [num1]
  sub eax, '0'

  mov ebx, [num2]
  sub ebx, '0'

  add eax, ebx
  add eax, '0'

  mov [sum], eax
  
  mov eax, SYS_WRITE
  mov ebx, SYS_EXIT
  mov ecx, sum
  mov edx, 10
  int 0x80

  exit:

  mov eax, SYS_EXIT
  int 0x80
