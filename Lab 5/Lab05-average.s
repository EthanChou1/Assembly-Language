		.syntax     unified
		.cpu        cortex-m4

		.data
array:	.word	23355
		.word	22843
		.word	23175
		.word	17158

		.text
		.global		average1
		.thumb_func
		.align
average1:				// Function entry point
//	Add your assembly code here
		LDR r12, =array
		LDR r0, [r12, #0]
		LDR r1, [r12, #4]
		LDR r2, [r12, #8]
		LDR r3, [r12, #12]
		ADD r0, r1
		ADD r0, r2
		ADD r0, r3
		MOV r12, #4
		UDIV r0, r12
		bx	lr			// Return average
		.global		average2
		.thumb_func
		.align
average2:				// Function entry point
//	Add your assembly code here
		LDR r12, =array
		MOV r2, #0
		MOV r1, #0
		LDR r0, [r12, r2, LSL #2]
		ADD r1, r0
		MOV r2, #1
		LDR r0, [r12, r2, LSL #2]
		ADD r1, r0
		MOV r2, #2
		LDR r0, [r12, r2, LSL #2]
		ADD r1, r0
		MOV r2, #3
		LDR r0, [r12, r2, LSL #2]
		ADD r1, r0
		MOV r12, #4
		UDIV r1, r12
		MOV r0, r1
		bx	lr			// Return average

		.end
