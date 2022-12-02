    .syntax     unified
	.cpu        cortex-m4
    .equ DISPLAY,             0xD0000000

	.text
	.global		rect
    .thumb_func
    .align
rect:
// Complete this function with your assembly code from Lab #7 and new modifications
// Your assembly code goes here
    push {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, =#0xD0000000 
	ldr r2, =#96200
    mov r4, #50
    mov r5, #100
    mov r6, #240
	mov r7, r1
	mov r10, r2
	ldr r0, [r7, r10]
    mov r9, #0
    mov r12, #0
    loopi:
	loopj:
	bl random
    orr r0, #0xFFFFFFF
	lsl r0, #24
	ldr r3, [r0]
    mul r8, r5, r6
    add r8, r4
	str r3, [r7, r10, LSL #2]
	mov r10, r8
    add r10, #4
    add r4, #1
    add r12, #1
    cmp r12, #150
    blo loopj
    mov r4, #50
    mov r12, #0
    add r5, #1
    add r9, #1
    cmp r9, #150
    blo loopi
    pop {r4, r5, r6, r7, r8, r9, r10, r11, pc}

	.end
	