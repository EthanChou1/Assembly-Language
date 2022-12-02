		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		sum1
		.thumb_func
		.align
sum1:					// Function entry point
// Fill in assembly instructions here to sum all four
// function arguments, plus an additional constant of
// 0x004C, and return the sum to the calling program.
// In this function use only 'adds  r0, r1' instructions
// to perform additions, and any number of 'movs' instructions.
		adds		r0, r1	// Add R1 to R0
		movs		r1, r2 
		adds		r0, r1
		movs		r1, r3
		adds		r0, r1
		movs		r1, #0x004C
		adds		r0, r1
		bx	lr				// Return to calling program

		.global		sum2
		.thumb_func
		.align
sum2:					// Function entry point
// Fill in assembly instructions here to sum all four
// function arguments, plus an additional constant of
// 0x004C, and return the sum to the calling program.
// In this function use any 'adds' instruction you like
// to perform additions, but NO 'movs' instructions.
		adds		r0, r1
		adds		r0, r2
		adds		r0, r3
		svc			#0
		adds		r0, #0x004C
		svc			#0
		bx	lr				// Return to calling program

		.end
