[org 0x7c00]

mov ah,0x0e
mov si,msg

print:
lodsb
cmp al,0
je halt
int 0x10
jmp print

halt:
jmp $

msg db "Booting Wendigo OS...",0

times 510-($-$$) db 0
dw 0xaa55
