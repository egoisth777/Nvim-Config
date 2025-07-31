.data
    msg db 'Hello, World!', 0
    number dd 42

.code
main proc
    ; Move immediate value to register
    mov eax, 5
    mov ebx, 10
    
    ; Add registers
    add eax, ebx
    
    ; Compare values
    cmp eax, 15
    je equal_label
    
    ; Jump unconditionally
    jmp end_label
    
equal_label:
    ; Increment register
    inc eax
    
    ; Bitwise operations
    and eax, 0FFh
    or ebx, eax
    xor ecx, ecx
    
    ; Stack operations
    push eax
    pop edx
    
end_label:
    ; System call
    mov eax, 1
    int 80h
    
main endp
end main 