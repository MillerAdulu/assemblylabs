# Code Snippets

## Looping

An example of a `for loop`. One never goes wrong with a for loop

*Java*

```
  for(int i = 0; i < 5; i ++) {
    System.out.println('Repeating this message!');
  }
```

*Assembly*

```
  %macro printer 0
      mov eax, 4
      mov ebx, 1
      mov ecx, msg
      mov edx, len
      int 0x80
  %endmacro

  section .data
      msg db "Repeating this message!", 10
      len equ $ - msg

  section .text
      global _start
      _start:
      
      mov eax, 0
      jmp forLoop
      
      forLoop:    ; Start for loop
      cmp eax, 5  ; Does EAX equal 5 yet? 
      je finished ; If it does, then we want to quit our loop.
      
      push eax    ; Putting what EAX currently equals on the top of the stack, to save it for later.	
      
      printer
      
      pop eax     ; Getting out previous EAX value off of the stack and back into the register
      add eax, 1  ; Adding one to EAX 
      jmp forLoop ; Repeating our loop
      
      
      finished:
      mov eax, 1	; Telling our kernel that we're going to exit this progam
      mov ebx, 0	; Our exit code (0)
      int 0x80	  ; Calling our kernel
```

## Macros

```
  %macro print_message 2
    mov edx, %2 ; length
    mov ecx, %1 ; Message
    mov ebx, SYSTEM_OUT
    mov eax, SYSTEM_WRITE
    int 80h	
  %endmacro

  %macro read_input 2
    mov eax, SYSTEM_READ
    mov ebx, SYSTEM_IN
    mov ecx, %1 ; variable
    mov edx, %2 ; length
    int 80h
  %endmacro

  section .data

    SYSTEM_READ equ 3
    SYSTEM_WRITE equ 4
    SYSTEM_IN equ 0
    SYSTEM_OUT equ 1
    SYSTEM_EXIT equ 1

    prompt db "Enter your name: "
    promptLen equ $-prompt
    helloMsg dq "Hello "
    helloMsgLen equ $-helloMsg
    
  section .bss
    name resb 15 ; Reserve 15 bytes for name
    
  section .text
    global _start
    
    _start:
      print_message prompt, promptLen ; Print prompt

      read_input name, 15 ; Read input
      
      print_message helloMsg, helloMsgLen ; Output hello message

      print_message name, 15 ; Output name
      
      mov eax, SYSTEM_EXIT
      int 80h

```

## Print stars vertically using procedures

```
  section .data
    STARS TIMES 8 DD '*', 10   ; To print them horizontally remove the , 10

  section .text
    global _start
    _start:
    
    call writer
    
    writer:
    mov eax, 4
    mov ebx, 1
    mov ecx, STARS
    mov edx, 31
    int 0x80
    ret
    
    mov eax, 1
    int 80h
```

## Add numbers from user input

```
  ;Definition of all macros

  ; 1 - Display info
  %macro prompt 2
    mov eax, SYS_WRITE
    mov ebx, SYS_EXIT
    mov ecx, %1
    mov edx, %2
    int 0x80
  %endmacro
  ; 2 - Read number from input
  %macro acceptNumber 1
    mov eax, SYS_READ
    mov ebx, FILE_DESCRIPTOR
    mov ecx, %1
    mov edx, 10
    int 0x80
  %endmacro

  ; 3 - Convert number to be operable by assembler
  %macro convertToString 2
    mov %1, [%2]
    sub %1, '0'
  %endmacro

  ; 4 - Add numbers
  %macro sumNumbers 2
    add %1, %2
    add %1, '0'
    mov [sum], %1
  %endmacro

  section .data
    
    FILE_DESCRIPTOR EQU 1
    SYS_EXIT EQU 1
    SYS_READ EQU 3
    SYS_WRITE EQU 4

    NUM1_PROMPT DD "Enter Num 1: "
    NUM1_PROMPT_LEN EQU $ - NUM1_PROMPT
    
    NUM2_PROMPT DD "Enter Num 2: "
    NUM2_PROMPT_LEN EQU $ - NUM2_PROMPT

  section .bss
    num1 RESW 2
    num2 RESW 2
    sum RESW 2

  section .text
    global _start:
    _start:

    prompt NUM1_PROMPT, NUM1_PROMPT_LEN
    acceptNumber num1

    prompt NUM2_PROMPT, NUM2_PROMPT_LEN
    acceptNumber num2

    convertToString eax, num1
    convertToString ebx, num2

    sumNumbers eax, ebx

    prompt sum, 10
    
    exit:
    mov eax, SYS_EXIT
    int 0x80

```

## Cat 1 QST 2 (Slight error in printing Ball correctly)

```
  %macro printer 0
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80
  %endmacro

  %macro switch 2
    mov ecx, %1         ; Move the value to be raplaced into ecx
    mov [msg+%2], ecx   ; Replace value at the index [msg+0] == [msg], [msg+1] -> at second place
  %endmacro

  section .data
    msg db "Base Ball"
    len equ $ - msg

  section .text
    global _start
    _start:
    
    switch 'H', 0
    switch 'a', 1
    switch 'n', 2
    switch 'd', 3
    
    printer
```