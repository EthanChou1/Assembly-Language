    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		int2asc
    .thumb_func
    .align
int2asc:
// Your assembly code goes here
	bx	lr

	.global		asc2int
    .thumb_func
    .align
asc2int:
// Your assembly code goes here
	bx	lr
	.end
