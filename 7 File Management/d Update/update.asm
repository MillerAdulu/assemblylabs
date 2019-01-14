section .data
  fileName DB 'update.txt'
  msg DB 'Here is your update sir'

  msgLen EQU $ - fileName

section .bss
  fdout resb 1
  fdin resb 1
  info resb 1

section .text
  global _start:
  _start:

  
