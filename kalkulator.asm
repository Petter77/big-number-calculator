section .data
num1 db "12ABDE"
num1_arr times 1 db 0

section .text
    global  _start
_start:
    call t_loop
  	jmp program_end      

t_loop:
    mov     edx,0
    .loop:
        mov     al, [num1+edx]
        call check_char
    inc edx
    cmp edx, 3
    jl  .loop


check_char:
    mov     bl, 0x00
    cmp     al, '0'
    je      .found
    
    add     bl, 0x01
    cmp     al, '1'
    je      .found

    add     bl, 0x01
    cmp     al, '2'
    je      .found

    add     bl, 0x01
    cmp     al, '3'
    je      .found

    add     bl, 0x01
    cmp     al, '4'
    je      .found

    add     bl, 0x01
    cmp     al, '5'
    je      .found

    add     bl, 0x01
    cmp     al, '6'
    je      .found

    add     bl, 0x01
    cmp     al, '7'
    je      .found

    add     bl, 0x01
    cmp     al, '8'
    je      .found

    add     bl, 0x01
    cmp     al, '9'
    je      .found

    
    add     bl, 0x01
    cmp     al, 'a'
    je      .found
    cmp     al, 'A'
    je      .found

    add     bl, 0x01
    cmp     al, 'b'
    je      .found
    cmp     al, 'B'
    je      .found

    add     bl, 0x01
    cmp     al, 'c'
    je      .found
    cmp     al, 'C'
    je      .found

    add     bl, 0x01
    cmp     al, 'd'
    je      .found
    cmp     al, 'D'
    je      .found

    add     bl, 0x01
    cmp     al, 'e'
    je      .found
    cmp     al, 'E'
    je      .found

    add     bl, 0x01
    cmp     al, 'f'
    je      .found
    cmp     al, 'F'
    je      .found
    jmp     .not_found

    .found:
        test edx, 1      
        jz .even        
        jmp .not_even
        
        .not_even:
            add     ecx, ebx
            mov     [num1_arr+edx], ecx
            ret   
        .even:
            shl     ebx, 4
            mov     ecx, ebx
            ret
        .not_found:
            ret



program_end:
    mov     ebx, 0              
    mov     eax, 1              
    int     0x80