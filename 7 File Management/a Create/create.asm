section .data

  SYS_CREATE EQU 8
  fileName DB "icsb.txt"

section .text
  global _start
    _start:

    mov eax, SYS_CREATE
    mov ebx, fileName
    mov ecx, 777
    int 80h