.Ltext0:
                    .globl  prod
                prod:
                .LFB0:
                    .cfi_startproc
0000 55             pushq   %rbp
                    .cfi_def_cfa_offset 16
                    .cfi_offset 6, -16
0001 4889E5         movq    %rsp, %rbp
                    .cfi_def_cfa_register 6
0004 4883EC10       subq    $16, %rsp
0008 897DFC         movl    %edi, -4(%rbp)
000b 837DFC01       cmpl    $1, -4(%rbp)
000f 7507           jne .L2
0011 B8010000       movl    $1, %eax
     00
0016 EB11           jmp .L3
                .L2:
0018 8B45FC         movl    -4(%rbp), %eax
001b 83E801         subl    $1, %eax
001e 89C7           movl    %eax, %edi
0020 E8000000       call    prod
     00
0025 0FAF45FC       imull   -4(%rbp), %eax
                .L3:
0029 C9             leave
                    .cfi_def_cfa 7, 8
002a C3             ret
                    .cfi_endproc
                .LFE0:
                    .section    .rodata
                .LC0:
0000 506F7369       .string "Positive integer,N: "
     74697665 
     20696E74 
     65676572 
     2C4E3A20 
                .LC1:
0015 256400         .string "%d"
                .LC2:
0018 54686520       .string "The value of product of %d"
     76616C75 
     65206F66 
     2070726F 
     64756374 
0033 00000000       .align 8
     00
                .LC3:
0038 20636F6E       .string " consecutive integers starting from 1 is:%d"
     73656375 
     74697665 
     20696E74 
     65676572 
                    .text
                    .globl  main
                main:
                .LFB1:
                    .cfi_startproc
002b 55             pushq   %rbp
                    .cfi_def_cfa_offset 16
                    .cfi_offset 6, -16
002c 4889E5         movq    %rsp, %rbp
                    .cfi_def_cfa_register 6
002f 4883EC10       subq    $16, %rsp
0033 64488B04       movq    %fs:40, %rax
     25280000 
     00
003c 488945F8       movq    %rax, -8(%rbp)
0040 31C0           xorl    %eax, %eax
0042 BF000000       movl    $.LC0, %edi
     00
0047 B8000000       movl    $0, %eax
     00
004c E8000000       call    printf
     00
0051 488D45F4       leaq    -12(%rbp), %rax
0055 4889C6         movq    %rax, %rsi
0058 BF000000       movl    $.LC1, %edi
     00
005d B8000000       movl    $0, %eax
     00
0062 E8000000       call    __isoc99_scanf
     00
0067 8B45F4         movl    -12(%rbp), %eax
006a 89C6           movl    %eax, %esi
006c BF000000       movl    $.LC2, %edi
     00
0071 B8000000       movl    $0, %eax
     00
0076 E8000000       call    printf
     00
007b 8B45F4         movl    -12(%rbp), %eax
007e 89C7           movl    %eax, %edi
0080 E8000000       call    prod
     00
0085 89C6           movl    %eax, %esi
0087 BF000000       movl    $.LC3, %edi
     00
008c B8000000       movl    $0, %eax
     00
0091 E8000000       call    printf
     00
0096 B8000000       movl    $0, %eax
     00
009b 488B55F8       movq    -8(%rbp), %rdx
009f 64483314       xorq    %fs:40, %rdx
     25280000 
     00
00a8 7405           je  .L6
00aa E8000000       call    __stack_chk_fail
     00
                .L6:
00af C9             leave
                    .cfi_def_cfa 7, 8
00b0 C3             ret
                    .cfi_endproc
                .LFE1:
                .Letext0: