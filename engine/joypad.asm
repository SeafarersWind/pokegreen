_Joypad::
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.

	ld a, 1 << 5 ; select direction keys
	ld c, 0

	ldh [rJOYP], a
REPT 6
	ldh a, [rJOYP]
ENDR
	cpl
	and %1111
	swap a
	ld b, a

	ld a, 1 << 4 ; select button keys
	ldh [rJOYP], a
REPT 10
	ldh a, [rJOYP]
ENDR
	cpl
	and A_BUTTON + B_BUTTON + SELECT + START + D_UP
	cp A_BUTTON + B_BUTTON + SELECT + START ; soft reset
	jr nz, .buttonPresses
	jp TrySoftReset

.buttonPresses
; hJoyReleased: (hJoyLast ^ hJoyInput) & hJoyLast
; hJoyPressed:  (hJoyLast ^ hJoyInput) & hJoyInput
	or b
	ld b, a
	ldh a, [hJoyLast]
	ld e, a
	xor b
	ld d, a
	and e
	ldh [hJoyReleased], a
	ld a, d
	and b
	ldh [hJoyPressed], a

	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ldh [rJOYP], a
	ld a, b
	ldh [hJoyLast], a

	ld a, [wStatusFlags5]
	bit BIT_DISABLE_JOYPAD, a
	jr nz, DiscardButtonPresses

	ldh a, [hJoyLast]
	ldh [hJoyHeld], a

	ld a, [wJoyIgnore]
	and a
	ret z

	cpl
	ld b, a
	ldh a, [hJoyHeld]
	and b
	ldh [hJoyHeld], a
	ldh a, [hJoyPressed]
	and b
	ldh [hJoyPressed], a
	ret

DiscardButtonPresses:
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ret

TrySoftReset:
	call DelayFrame

	; deselect (redundant)
	ld a, $30
	ldh [rJOYP], a

	ld hl, hSoftReset
	dec [hl]
	jp z, SoftReset

	jp Joypad
