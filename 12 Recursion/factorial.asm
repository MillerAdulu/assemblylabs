section .data
  msg db

section .text
  global start
  _start:

  mov bx, 3
  call proc_fact
  add ax, 30h
  mov [fact], ax

  mov edx, len
  mov ecx, 