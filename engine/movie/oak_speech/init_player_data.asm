InitPlayerData:
InitPlayerData2:

	call Random
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wUnusedPlayerDataByte], a

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wBoxCount
	call InitializeEmptyList
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

DEF START_MONEY EQU $3000
	xor a ; LOW(START_MONEY)
	ld [wMonDataLocation], a

	ld [wObtainedBadges], a
	ld [wObtainedBadges+1], a
	ASSERT wObtainedBadges + 1 == wUnusedObtainedBadges

	ld [wPlayerCoins], a
	ld [wPlayerCoins+1], a
	ld [wPlayerMoney], a
	ld [wPlayerMoney+2], a
	ld a, START_MONEY >> 8
	ld [wPlayerMoney+1], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	xor a
	call FillMemory ; clear all game progress flags

	jp InitializeMissableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret
