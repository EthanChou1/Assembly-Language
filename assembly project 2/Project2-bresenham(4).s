// Follows the integer arithmetic algorithm at
// https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
		.syntax     unified
		.cpu        cortex-m4
		.text
		.global		bresenham
		.thumb_func
		.align
bresenham:
//              Write code here for the bresenham function
// i = column, j = row, [(j*240)+i]*4 (i,j) (i, j, i2, j2)
    push {r4, r5, r6, r7, r8, r9, r10, r11}
    MOV r4, r0
    MOV r5, r1
    MOV r6, #240
    MOV r7, #4
    sub r10, r2, r0
	sub r11, r3, r1
	mov r12, #2
	mul r12, r11
	sub r12, r10
	mov r8, r1
	LDR r1, =#0xD0000000 
	LDR r3, =#0xFFFF0000
	LDR r0, [r1, r2]
    MOV r9, #2
	mov r5, r10
	mul r10, r9
	mul r11, r9
	mov r9, #0
    loopi:
	mul r9, r8, r6
	add r9, r4
	mov r2, r9
	STR r3, [r1, r2, LSL #2]
	add r4, #1
	cmp r12, #0
	ittte gt
	addgt r8, #1
	subgt r12, r10
	addgt r12, r11
	addle r12, r11
    cmp r4, r5
    blo loopi
    pop {r4, r5, r6, r7, r8, r9, r10, r11}
	bx		lr
	.end

		