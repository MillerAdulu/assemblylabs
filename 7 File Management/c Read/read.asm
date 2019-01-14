section .data
  FILE_OPEN EQU 5
  FILE_READ EQU 3
  FILE_CLOSE EQU 6
  fileName db 'icsb.txt'
  fileNameLeng equ $ - fileName

section .bss
  fd_in resb 9
  info resb 30

section .text
  global _start
  _start:

  mov eax, FILE_OPEN
  mov ebx, fileName
  mov ecx, 0
  mov edx, 0777
  int 80h

  mov [fd_in], eax

  mov eax, FILE_READ
  mov ebx, [fd_in]
  mov ecx, info
  mov edx, 30
  int 80h

  mov eax, FILE_CLOSE
  mov ebx, [fd_in]
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, info
  mov edx, 26
  int 80h

  mov eax, 1
  int 80h

