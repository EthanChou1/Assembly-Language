		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		determinant
		.thumb_func
		.align
determinant:
// Complete this function with your assembly code

		vldr s0, [r0]
		add r0, #4
		vldr s1, [r0]
		add r0, #4
		vldr s2, [r0]
		add r0, #4
		vmul.f32 s1, s2
		vldr s2, [r0]
		vmul.f32 s0, s2
		vsub.f32 s0, s1
		bx	lr
		.end