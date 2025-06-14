	ld a, [wLinkState]
	bit 7, a
	ret z
	ld a, [wSerialPlayerDataBlock]
	dec a
	ld [wSerialPlayerDataBlock], a
	ret nz
	ld a, [wUnusedAlreadyOwnedFlag]
	dec a
	ld [wUnusedAlreadyOwnedFlag], a
	ret nz
	ld a, $0A
	ld [wUnusedAlreadyOwnedFlag], a
	ld a, [wUnusedAlreadyOwnedFlag+1]
	xor a, 1
	ld [wUnusedAlreadyOwnedFlag+1], a
	jp z, LoadScreenTilesFromBuffer1

; [wCurSpecies] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [wMonHType1]
	call PrintType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	pop hl
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 2
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	push hl
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text:
	ld a, " "
	ld bc, $11
	add hl, bc
	ld [hl], a
	inc bc
	add hl, bc
	ld bc, $5
	jp FillMemory

PrintMoveType:
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
; fall through

PrintType_:
	add a
	ld hl, TypeNames
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/types/names.asm"
