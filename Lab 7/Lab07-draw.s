    .syntax     unified
	.cpu        cortex-m4
    .equ COLOR_BLUE,          0xFF0000FF
    .equ COLOR_GREEN,         0xFF00FF00
    .equ COLOR_RED,           0xFFFF0000
    .equ COLOR_CYAN,          0xFF00FFFF
    .equ COLOR_MAGENTA,       0xFFFF00FF
    .equ COLOR_YELLOW,        0xFFFFFF00
    .equ COLOR_LIGHTBLUE,     0xFF8080FF
    .equ COLOR_LIGHTGREEN,    0xFF80FF80
    .equ COLOR_LIGHTRED,      0xFFFF8080
    .equ COLOR_LIGHTCYAN,     0xFF80FFFF
    .equ COLOR_LIGHTMAGENTA,  0xFFFF80FF
    .equ COLOR_LIGHTYELLOW,   0xFFFFFF80
    .equ COLOR_DARKBLUE,      0xFF000080
    .equ COLOR_DARKGREEN,     0xFF008000
    .equ COLOR_DARKRED,       0xFF800000
    .equ COLOR_DARKCYAN,      0xFF008080
    .equ COLOR_DARKMAGENTA,   0xFF800080
    .equ COLOR_DARKYELLOW,    0xFF808000
    .equ COLOR_WHITE,         0xFFFFFFFF
    .equ COLOR_LIGHTGRAY,     0xFFD3D3D3
    .equ COLOR_GRAY,          0xFF808080
    .equ COLOR_DARKGRAY,      0xFF404040
    .equ COLOR_BLACK,         0xFF000000
    .equ COLOR_BROWN,         0xFFA52A2A
    .equ COLOR_ORANGE,        0xFFFFA500
    .equ DISPLAY,             0xD0000000

    .text 
	.global		rect
    .thumb_func
    .align
rect:
// Your assembly code goes here
    push {r4, r5, r6, r7, r8, r9}
    ldr r1, =#0xD0000000 
	ldr r2, =#144200
	mov r3, r0
    mov r4, #50
    mov r5, #150
    mov r6, #240
    mov r7, #4
	ldr r0, [r1, r2]
    mov r9, #0
    mov r12, #0
    loopi:
	loopj:
	STR r3, [r1, r2, LSL #0]
    mul r8, r5, r6
    add r8, r4
    mul r8, r7
    mov r2, r8
    add r2, #4
    add r4, #1
    add r12, #1
    cmp r12, #99
    blo loopj
    mov r4, #50
    mov r12, #0
    add r5, #1
    add r9, #1
    cmp r9, #99
    blo loopi
    pop {r4, r5, r6, r7, r8, r9}
	bx	lr
	.end
