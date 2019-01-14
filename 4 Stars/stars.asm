section .data
  SYS_EXIT EQU 1
  SYS_WRITE EQU 4
  LOOP_SIZE EQU 10
  STARS TIMES LOOP_SIZE DW '*'

section .text

  global _start
  _start:

  mov ecx, LOOP_SIZE
  mov eax, [STARS]

  STAR_LOOP:

    mov eax, SYS_WRITE
    mov ebx, SYS_EXIT
    mov edx, 19

  DEC ecx
  JNZ STAR_LOOP

