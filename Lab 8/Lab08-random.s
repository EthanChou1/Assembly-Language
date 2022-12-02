		.syntax     unified
		.cpu        cortex-m4

		.data
state:	.word	0x01	// static variable to hold state of pseudorandom generator

		.text
		.global		seed_random
		.thumb_func
		.align
seed_random:
		ldr		r1, =state	// point to random state
		str		r0, [r1]	// set random state
		bx		lr

		.global		random
		.thumb_func
		.align
random:
// Complete this function with your assembly code
		ldr r1, =state
		ldr r0, [r1]
		lsls r0, #1
		ldr r2, =#0x1D872B41
		itte cc 
		eorcc r0, r2
		strcc r0, [r1]
		strcs r0, [r1]
		bx		lr
		.end
