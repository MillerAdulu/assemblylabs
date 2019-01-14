section .bss
  numbers resw 24

section .text
  global _start:
  _start:

  mov eax, '3'
  mov [numbers], eax

  mov eax, '5'
  mov [numbers+4], eax

  mov eax, '7'
  mov [numbers+8], eax

  mov eax, '9'
  mov [numbers+12], eax

  mov eax, 4
  mov ebx, 1
  mov ecx, numbers
  mov edx, 15
  int 0x80

  mov eax, 1
  int 0x80