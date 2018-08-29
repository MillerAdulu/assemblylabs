section .data

msg db 'Hello world', 0xa ; String to be edited
msgMine db 'This is my first assembly program', 0xa
len equ $ - msg ; Define the length of the string
lenMine equ $ - msgMine

section .text
  global _start

  _start:

    mov edx, len ; Move message length to register edx
    mov ecx, msg ; Move message to register ecx
    mov ebx, 1   ; File descriptor(stdout)
    mov eax, 4   ; System call (system write)
    int 0x80     ; Kernel call

    mov edx, lenMine
    mov ecx, msgMine
    mov eax, 4

    mov eax, 1   ; System call (exit)
    int 80h      ; Kernel call