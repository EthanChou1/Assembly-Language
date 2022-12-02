	.syntax     unified
	.cpu        cortex-m4
	.equ RCC_APB1ENR, 0x40023840
    .equ TIM3_CR1,    0x40000400
    .equ TIM3_CR2,    0x40000404
    .equ TIM3_DIER,   0x4000040C
    .equ TIM3_SR,     0x40000410
    .equ TIM3_EGR,    0x40000414
    .equ TIM3_CNT,    0x40000424
    .equ TIM3_PSC,    0x40000428
    .equ TIM3_ARR,    0x4000042C
    .equ NVIC_ISER0,  0xE000E100

	.bss
// Allocate the multitasking task index
// This integer is set to value alternating between 0 and 1 by the
// Timer 3 update interrupt service routine. This is a global variable
// accessed by the C main program, and is used as an index for which
// task is run in the main program thread.
	.global		task
task:
	.word 0

	.text

// Function to set up Timer 3 interrupts
// Expects one argument:
//  R0: uint32_t value to load into Timer 3 auto-reload register
	.global		setupTimer
	.thumb_func
	.align
setupTimer:
// Enable the Timer 3 peripheral clock by setting bit 1
	ldr r2, =RCC_APB1ENR
	ldr r1, [r2]
	orr r1, 0x02
	str r1, [r2]

// Set TIM3 prescaler count, assuming the C system initialization
// sets the low speed ABP1 bus clock to its maximum of 45MHz.
// This makes the Timer 3 clock 45MHz *2 /45000 = 2kHz
	ldr r2, =TIM3_PSC
	mov r1, #44999
	str r1, [r2]

// Set the Timer 3 auto-reload to 20 for 10msec interrupt interval
// Set the Timer 3 auto-reload to 200 for 100msec interrupt interval
// Set the Timer 3 auto-reload to 2000 for 1sec interrupt interval
	ldr r2, =TIM3_ARR
	str r0, [r2]

// Update Timer 3 registers with manually triggered update
	ldr r2, =TIM3_EGR
	mov r1, 0x01
	str r1, [r2]
        
// Clear preexising Timer 3 update interrupt by clearing bit 0
	ldr r2, =TIM3_SR	// point to Timer 3 status register
	ldr r1, [r2]		// reset UIF flag
	bic r1, 0x01
	str r1, [r2]

// Enable Timer 3 update interrupts by setting bit 0
	ldr r2, =TIM3_DIER
	ldr r1, [r2]
	orr r1, 0x01
	str r1, [r2]

// Enable Timer 3 global interrupts by setting bit 29
	ldr r2, =NVIC_ISER0
	ldr r1, [r2]
	orr r1, 0x20000000
	str r1, [r2]

// Leave reset Timer 3 interrupt priority value at 0 in NVIC_IPR7

// Enable interrupts
	cpsie i

// Enable Timer 3 by setting bit 0
	ldr r2, =TIM3_CR1
	ldr r1, [r2]
	orr r1, 0x01
	str r1, [r2]

	bx	lr

//
// Timer 3 interrupt request handler
// This handler must reset the UI flag bit 0 in the Timer 3 status
// register TIM3_SR, and invert bit 0 in the task index global
// variable so that the variable alternates between 0 and 1.
//
	.global		TIM3_IRQHandler
	.thumb_func
	.align
TIM3_IRQHandler:
// Add your assembly code lines here
ldr r2, =TIM3_SR
ldr r1, [r2]
bic r1, 0x01
str r1, [r2]
ldr r2, =task
ldr r1, [r2]
eor r1, 0x01
str r1, [r2]

	bx lr

	.end
