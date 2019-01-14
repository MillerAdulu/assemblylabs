%macro writer 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 0x80

%endmacro

section .data
  STARS TIMES 8 DD '*', 0xa

section .text
  global _start
  _start:
  
  writer STARS, 62
  
  mov eax, 1
  int 80h
