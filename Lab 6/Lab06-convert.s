    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		int2asc
    .thumb_func
    .align
int2asc:
// Your assembly code goes here
	cmp r0, #0x0A
	ite lo
	addlo r0, #0x30
	addhs r0, #0x37
	bx	lr

	.global		asc2int
    .thumb_func
    .align
asc2int:
// Your assembly code goes here
	cmp r0, #0x3A
	ite lo
	sublo r0, #0x30
	subhs r0, #0x37
	bx	lr
	.end
