%macro shifter 0
  add esi, 1
  add eax, [esi]
%endmacro

section .data
  x db 2, 3, 3
  sum db 3

section .text
  global _start
  _start:
  
  mov esi, x
  mov eax, [esi]

  mov ecx, 0

  l1:  
    cmp ecx, 2
    jge l2
    shifter
    add ecx, 1
    jmp l1

  l2:
  add eax, '0'
  mov [sum], eax

  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 15
  int 0x80

  mov eax, 1
  int 80h
