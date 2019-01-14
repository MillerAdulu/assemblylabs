section .data

  SYS_READ EQU 3
  SYS_EXIT EQU 4
  FILE_DESCRIPTOR EQU 1

  prompt DB "Enter the letter: "
  promptLength EQU $ - prompt

section .bss
  letter resb 10

section .text

global _start

_start:

  mov ecx, prompt
  mov edx, promptLength
  mov ebx, FILE_DESCRIPTOR
  mov eax, SYS_EXIT
  int 0x80

  mov eax, SYS_READ
  mov ebx, 0
  mov ecx, letter
  mov edx, 10
  int 0x80

  mov eax, [letter]
  sub eax, '0'

  sub eax, 32
  add eax, '0'

  mov [letter], eax

  mov eax, SYS_EXIT
  mov ebx, FILE_DESCRIPTOR
  mov ecx, letter
  mov edx, 1

  mov eax, 1
  int 0x80
