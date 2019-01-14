section .data
  SYS_EXIT EQU 1
  FILE_DESCRIPTOR EQU 1
  SYS_READ EQU 3
  SYS_WRITE EQU 4

  DIVIDEND_PROMPT DD "Enter dividend: "
  DIVISOR_PROMPT DD "Enter divisor: "

section .bss
  dividend RESB 1
  divisor RESB 1

  quotient RESB 1
  remainder RESB 1

section .text
  global _start
  _start:

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, DIVIDEND_PROMPT
  mov edx, 16
  int 0x80

  mov eax, SYS_READ
  mov ebx, FILE_DESCRIPTOR
  mov ecx, dividend
  mov edx, 1
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, DIVISOR_PROMPT
  mov edx, 15
  int 0x80

  mov eax, SYS_READ
  mov ebx, FILE_DESCRIPTOR
  mov ecx, divisor
  mov edx, 1
  int 0x80

  mov ax, [dividend]
  sub ax, '0'

  mov edx, [divisor]
  sub edx, '0'

  div edx
  add al, '0'
  add ah, '0'

  mov [quotient], al
  mov [remainder], ah

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, quotient
  mov edx, 2
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, FILE_DESCRIPTOR
  mov ecx, dividend
  mov edx, 2
  int 0x80

  exit:
  mov eax, SYS_EXIT
  int 0x80