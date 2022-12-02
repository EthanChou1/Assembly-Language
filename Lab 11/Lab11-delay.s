		.syntax     unified
		.cpu        cortex-m4

		.text
		.global		delay
		.thumb_func
		.align
delay:
		ldr		r1, =#10000
		mul		r0, r1
loop:
		nop
// Insert several more 'nop' instructions here,
// or create a repeated block of 'nop' instructions
// with the .rept and .endr assembly directives
		.rept 14
		nop
		.endr
		subs	r0, #1
		bgt		loop
		bx		lr

		.end
