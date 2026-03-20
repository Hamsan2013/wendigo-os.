[org 0x7c00]

mov [BOOT_DRIVE], dl

mov si, bootmsg
call print

; load kernel from disk
mov bx, 0x1000
mov dh, 1
mov dl, [BOOT_DRIVE]

mov ah, 0x02
mov al, dh
mov ch, 0
mov cl, 2
mov dh, 0
int 0x13

jmp 0x0000:0x1000

; print function
print:
mov ah, 0x0e

print_loop:
lodsb
cmp al,0
je print_done
int 0x10
jmp print_loop

print_done:
ret

bootmsg db "Booting Wendigo OS...",0

BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xaa55
