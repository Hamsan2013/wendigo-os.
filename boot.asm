; Wendigo OS Bootloader

[org 0x7c00]

mov ah, 0x0e
mov si, message

print:
lodsb
cmp al, 0
je load_kernel
int 0x10
jmp print

load_kernel:

mov bx, 0x1000
mov dh, 1

mov ah, 0x02
mov al, dh
mov ch, 0
mov cl, 2
mov dh, 0
int 0x13

jmp 0x0000:0x1000

message db "Booting Wendigo OS...",0

times 510-($-$$) db 0
dw 0xaa55