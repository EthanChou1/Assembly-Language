		.syntax     unified
		.cpu        cortex-m4

		.bss
//		Write code here for the data words in the .bss section
//		to be initialized to zero
		numOne:	.word 0
		numTwo: .word 0
		state: .word 0

		.text
		.global		init_fibonacci
		.thumb_func
		.align
init_fibonacci:
//		Write code here for the init_fibonacci function
		ldr r1, =numOne
		mov r0, #0
		str r0, [r1]
		ldr r2, =numTwo
		mov r0, #1
		str r0, [r2]
		ldr r3, =state
		mov r0, #0
		str r0, [r3]
		bx	lr

		.global		fibonacci
		.thumb_func
		.align
fibonacci:
//		Write code here for the fibonacci function
		ldr r1, =numOne
		ldr r2, = numTwo
		ldr r3, =state
		ldr r12, [r3]
		ldr r0, [r1]
		cmp r12, #0
		bne notA
		add r12, #1
		str r12, [r3]
		b cont
notA:
		cmp r12, #1
		bne notB
		add r12, #1
		str r12, [r3]
		mov r0, #1
		b cont
notB:
		ldr r0, [r2]
		ldr r12, [r1]
		adds r0, r0, r12
		bcc nocarry
		mov r0, #0xFFFFFFFF
		b cont
nocarry:
		ldr r0, [r2]
		ldr r12, [r1]
		add r0, r0, r12
		ldr r12, [r2]
		str r12, [r1]
		str r0, [r2]
		

cont:
		bx  lr

		.end
