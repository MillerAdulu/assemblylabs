section .bss
  num resb 1
section .text
  global _start
  _start:
  mov eax, '0'
  mov ecx, 10
  mov edx, '5'

  l1:
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    push ecx

    mov ecx, num
    int 80h

    mov eax, [num]
    sub eax, '0'
    inc eax
    add eax, '0'
    cmp eax, edx
    je l2
    pop ecx

  loop l1
  l2:
  int 80h
