/* Global data section starts */
.data

N:
    .byte  10  

sum: 
    .long                 # 4 bytes

/* Code section starts */

.text
square:   #expects parameter in %ebx 
   movl %ebx, %ecx
   imul %ecx, %ecx  
   ret
.global main
main:
    movl  $0, %eax        # sum <-> %eax
    mov   N@GOTPCREL(%rip), %rbx        
    movzbl  (%rbx), %ebx    # N <-> %ebx
.Lback:
    cmpl  $0, %ebx
    je .Lloopexit
    call square
    addl %ecx, %eax         # sum = sum + i*i 
    dec   %ebx 
    jmp .Lback
.Lloopexit:
    mov sum@GOTPCREL(%rip), %rbx # reuse register %rbx
    mov %eax, (%rbx)
    ret
