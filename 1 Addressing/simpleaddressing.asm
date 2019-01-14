section .data
  SYS_EXIT EQU 1
  SYS_WRITE EQU 4

section .text
  global _start

  _start:

  mov eax, [MY_SLOTS]
  mov eax, SYS_WRITE
  ; mov [MY_SLOTS], 10
  ; mov eax, [MY_SLOTS]
  mov eax, SYS_EXIT

section .bss
  MY_SLOTS TIMES 4 DW 0