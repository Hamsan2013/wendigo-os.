[org 0x7c00]

; print boot message
mov ah, 0x0e
mov si, bootmsg

print:
lodsb
cmp al, 0
je load_kernel
int 0x10
jmp print

load_kernel:
; load 1 sector (kernel) from disk into memory at 0x1000
mov bx, 0x1000
mov ah, 0x02
mov al, 1        ; number of sectors
mov ch, 0
mov cl, 2        ; sector 2 (kernel)
mov dh, 0
mov dl, 0x00
int 0x13

jmp 0x0000:0x1000

bootmsg db "Booting Wendigo OS...",0

times 510-($-$$) db 0
dw 0xaa55
