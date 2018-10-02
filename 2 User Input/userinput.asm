section .data

  FILE_DESCRIPTOR EQU 1
  SYS_EXIT EQU 1
  SYS_READ EQU 3
  SYS_WRITE EQU 4

  PROMPT DD "Enter your name: "

section .bss

  myName RESW 10

section .text

  global _start
  _start:

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, PROMPT
  mov edx, 19
  int 0x80

  mov eax, SYS_READ
  mov ebx, SYS_EXIT
  mov ecx, myName
  mov edx, 23
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, myName
  int 0x80

  mov eax, SYS_EXIT
  int 0x80
