section .data
  msg dd 'My message'
  lmsg equ $ - msg
  file_name dd 'icsb.txt'

  SYS_WRITE equ 4
  SYS_READ equ 3
  SYS_CREATE equ 8
  SYS_EXIT equ 1
  SYS_CLOSE equ 6
  SYS_OPEN equ 5

section .bss
  fd_out resb 1
  fd_in resb 1
  message resb 26

section .text
  global _start
  _start:

  mov eax, SYS_OPEN
  mov ebx, file_name
  mov ecx, 0
  mov edx, 0777
  int 80h

  mov [fd_in], eax

  mov eax, SYS_READ
  mov ebx, [fd_in]
  mov ecx, message
  mov edx, 26
  int 80h

  mov eax, SYS_CLOSE
  mov ebx, [fd_in]
  int 80h

  mov eax, SYS_EXIT
  int 80h