%macro sysCalls 4
  mov eax, %1   ; System Call
  mov ebx, %2   ; File descriptor
  mov ecx, %3   ; Operand
  mov edx, %4   ; Length of the data
  int 80h
%endmacro

%macro toOsMode 2
  %1 %2, '0'
%endmacro

section .data

  FILE_DESCRIPTOR EQU 1
  SYS_WRITE EQU 4
  SYS_READ EQU 3
  SYS_EXIT EQU 1

  COUNTER_PROMPT DD "Please input a value less than 10: "
  COUNTER_PROMPT_LEN EQU $ - COUNTER_PROMPT

  SKIPPED DD "Finished cycle!!"
  SKIPPED_LEN EQU $ - SKIPPED

section .bss
  opCounter resb 1

section .text
  global _start:
  _start:

    sysCalls SYS_WRITE, FILE_DESCRIPTOR, COUNTER_PROMPT, COUNTER_PROMPT_LEN
    sysCalls SYS_READ, FILE_DESCRIPTOR, opCounter, 1

    mov ecx, opCounter
    ; toOsMode sub, ecx

    spinLoop:
      cmp byte[ecx], '0'
      je exit

      push ecx
      sysCalls SYS_WRITE, FILE_DESCRIPTOR, ecx, 1
      pop ecx

      sub ecx, '1'
      jmp spinLoop
    
    exit:
    sysCalls SYS_WRITE, FILE_DESCRIPTOR, SKIPPED, SKIPPED_LEN
    mov eax, SYS_EXIT
    int 80h
