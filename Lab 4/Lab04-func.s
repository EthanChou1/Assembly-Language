		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		ufunc
		.thumb_func
		.align
ufunc:					// Function entry point
//	Write your assembly code here
		LSL r0, r1
		SVC #0
		LSR r0, r1
		bx	lr			// Return to calling program

		.global		sfunc
		.thumb_func
		.align
sfunc:					// Function entry point
//	Write your assembly code here
		LSL r0, r1
		SVC #0
		ASR r0, r1
		bx	lr			// Return to calling program
		
		.end
