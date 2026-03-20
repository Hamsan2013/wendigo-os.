[org 0x1000]

; switch to VGA 320x200 graphics
mov ax, 0x0013
int 0x10

; video memory location
mov ax, 0xA000
mov es, ax
xor di, di

mov si, logo_data
mov cx, 64000

draw:
lodsb
stosb
loop draw

; wait for key
mov ah,0
int 0x16

; return to text mode
mov ax,0x0003
int 0x10

mov si,msg

print:
mov ah,0x0e
lodsb
cmp al,0
je halt
int 0x10
jmp print

halt:
jmp $

msg db "Wendigo OS Starting...",0

logo_data:
incbin "logo.raw"
