		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		diff
		.thumb_func
		.align
diff:					// Function entry point
		svc			#0		// Debug breakpoint
		mov			r2, 0  // Move constant 0 to R2
		svc			#0		// Debug breakpoint
		subs		r1, r2  // Subtract R1 from R2
		svc			#0		// Debug breakpoint
		adds		r0, r2, r3  // Add R2 to R0 and store in R3
		svc			#0		// Debug breakpoint
		subs		r1, r0	// Subtract R1 from R0
		svc			#0		// Debug breakpoint
		bx	lr				// Return to calling program

		.end
