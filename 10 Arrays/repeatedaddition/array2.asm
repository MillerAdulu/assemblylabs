%macro shifter 0
  add esi, 2
  add eax, [esi]
%endmacro

section .data
  numbers dw 5, 2, 1
  sum dw 0

section .text
  global _start:
  _start:

  mov esi, numbers  ;esi register as a pointer
  mov eax, [esi]

  shifter
  shifter

  add eax, '0'
  mov [sum], eax

  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 15
  int 0x80

  mov eax, 1
  int 80h