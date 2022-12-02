		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		map
		.thumb_func
		.align
map:
//              Write code here for the map function
	//x(n+1) = r * x(n) * (1 - x(n))
		push {r4, r5, r6, r7, r8, r9, r10, r11, r12}
		mov r7, #0
		loopi:
		vmul.f32 s3, s1, s0
		vmov s4, #1.0
		vsub.f32 s5, s4, s1
		vmul.f32 s1, s3, s5
		add r7, #1
		cmp r7, #101
		blo loopi
		mov r7, #0
		loopj:
		vmul.f32 s3, s1, s0
		vsub.f32 s5, s4, s1
		vmul.f32 s1, s3, s5
		add r7, #1
		vstr s1, [r0]
		add r0, #4
		cmp r7, #101
		blo loopj
		pop {r4, r5, r6, r7, r8, r9, r10, r11, r12}
		bx lr
		.end
