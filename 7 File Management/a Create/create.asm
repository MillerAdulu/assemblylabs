section .data
  msg dd 'My message'
  lmsg equ $ - msg
  file_name dd 'file.txt'

  SYS_WRITE equ 4
  SYS_READ equ 3
  SYS_CREATE equ 8
  SYS_EXIT equ 1
  SYS_CLOSE equ 6

section .bss
  fd_out resb 1
  
section .text
  global _start
  _start:

  mov eax, SYS_CREATE
  mov ebx, file_name
  mov edx, 0777
  int 80h

  mov [fd_out], eax

  mov eax, SYS_CLOSE
  mov ebx, [fd_out]

  mov eax, SYS_EXIT
  int 80h