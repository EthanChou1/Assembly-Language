    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		lo2up
    .thumb_func
    .align
lo2up:
// Complete this function with your assembly code
//Convert lowercase ascii to upper case ascii
     push {r4-r11}
	loop:
	ldrb r4, [r0]
	cmp r4, #96
	ittte hi
	eorhi r4, #32
	strbhi r4, [r0]
	addhi r0, #1
	addls r0, #1
	cmp r4, #0x00
	bne loop
	pop {r4-r11}
	.global		up2lo
    .thumb_func
    .align
up2lo:
// Complete this function with your assembly code
//Convert uppercase ascii to lower case ascii
    push {r4-r11}
	mov r1, r0
	loopi:
	ldrb r4, [r0]
	cmp r4, #96
	ittte hi
	eorhi r4, #32
	strbhi r4, [r0]
	addhi r0, #1
	addls r0, #1
	cmp r4, #0x00
	bne loopi
	mov r0, r1
	loopj:
	ldrb r4, [r0]
	cmp r4, #64
	ittte hi
	eorhi r4, #32
	strbhi r4, [r0]
	addhi r0, #1
	addls r0, #1
	cmp r4, #0x00
	bne loopj
	pop {r4-r11}
	.global		findchr
    .thumb_func
    .align
findchr:
// Complete this function with your assembly code
//search for an ascii character in an array
     push {r4-r11}
	loopk:
	ldrb r4, [r0]
	cmp r4, r1
	ittte eq
	moveq r2, r1
	addeq r0, #1
	moveq r4, #0x00
	addne r0, #1
	cmp r4, #0x00
	bne loopk
	cmp r2, r1
	itte ne
	movne r2, #0x00
	movne r0, r2
	streq r2, [r0]
	pop {r4-r11}
	bx lr
	.end
