		.syntax     unified
		.cpu        cortex-m4

		.text
		.global		func
		.thumb_func
		.align
func:					// Function entry point
//	Add your assembly code here
		LDR r1, =#0xD0000000 //0xE000ED00
		LDR r2, =#144400
		LDR r3, =#0xFFFF0000
		LDR r0, [r1, r2]
		.rept 10
		STR r3, [r1, r2]
		ADD r2, #960
		.endr
		bx	lr			// Function return

		.end
