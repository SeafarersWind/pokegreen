PrintCinnabarQuiz:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz::
	text_asm
	xor a
	ld [wOpponentAfterWrongAnswer], a
	ld a, [wHiddenObjectFunctionArgument]
	push af
	and $f
	ldh [hGymGateIndex], a
	pop af
	and $f0
	swap a
	ldh [hGymGateAnswer], a
	ld hl, CinnabarGymQuizIntroText
	call PrintText
	ldh a, [hGymGateIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarQuizQuestions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call CinnabarGymQuiz_AskQuestion
	jp TextScriptEnd

CinnabarGymQuizIntroText:
	text "#　クイズ！"

	para "せいかい　すると　ドアが　あいて"
	line "つぎへ　すすめます！"

	para "まちがえたら　でしの　<TRAINER>と"
	line "たたかって　いただきます！"

	para "ここの　りーダーに　あう　まで"
	line "#の　たいりょくを"
	cont "とって　おきたいなら！"

	para "がんばって　こたえて　ください！"
	line "では　おこたえ　ください！"
	prompt

CinnabarQuizQuestions:
	dw CinnabarQuizQuestionsText1
	dw CinnabarQuizQuestionsText2
	dw CinnabarQuizQuestionsText3
	dw CinnabarQuizQuestionsText4
	dw CinnabarQuizQuestionsText5
	dw CinnabarQuizQuestionsText6

CinnabarQuizQuestionsText1:
	text "#　キャタピーが　しんかすると"
	line "バタフりーに　なる？"
	done

CinnabarQuizQuestionsText2:
	text "#　りーグ　にんてい"
	line "バッジは　ぜんぶで　９しゅるい？"
	done

CinnabarQuizQuestionsText3:
	text "ニョロモは　３かい　しんかする"
	line "#　である？"
	done

CinnabarQuizQuestionsText4:
	text "かみなり　タイプの　わざを"
	line "くりだした　とき"

	para "じめん　タイプの　#には"
	line "よく　きく？"
	done

CinnabarQuizQuestionsText5:
	text "おなじ　レべルの　おなじ　#"
	line "でも　つかまえる　たびに"
	cont "つよさは　ちがう？"
	done

CinnabarQuizQuestionsText6:
	text "「<TM>２８」とは"
	line "「しねしねこうせん」である？"
	done

CinnabarGymGateFlagAction:
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	predef_jump FlagActionPredef

CinnabarGymQuiz_AskQuestion:
	call YesNoChoice
	ldh a, [hGymGateAnswer]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr nz, .wrongAnswer
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ldh a, [hGymGateIndex]
	ldh [hBackupGymGateIndex], a
	ld hl, CinnabarGymQuizCorrectText
	call PrintText
	ldh a, [hBackupGymGateIndex]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_SET
	call CinnabarGymGateFlagAction
	jp UpdateCinnabarGymGateTileBlocks_
.wrongAnswer
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ldh a, [hGymGateIndex]
	add $2
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	ldh a, [hGymGateIndex]
	add $2
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymQuizCorrectText:
	sound_get_item_1
	text "あたり　です！"

	para "さきへ　すすんで　いいです@"
	text_promptbutton
	text_asm

	ldh a, [hBackupGymGateIndex]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jp nz, TextScriptEnd
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CinnabarGymQuizIncorrectText:
	text "ばか　はずれです<……>"
	prompt

UpdateCinnabarGymGateTileBlocks_::
; Update the overworld map with open floor blocks or locked gate blocks
; depending on event flags.
	ld a, 6
	ldh [hGymGateIndex], a
.loop
	ldh a, [hGymGateIndex]
	dec a
	add a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarGymGateCoords
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld [wGymGateTileBlock], a
	push bc
	ldh a, [hGymGateIndex]
	ldh [hBackupGymGateIndex], a
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jr nz, .unlocked
	ld a, [wGymGateTileBlock]
	jr .next
.unlocked
	ld a, $e
.next
	pop bc
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld hl, hGymGateIndex
	dec [hl]
	jr nz, .loop
	ret

MACRO gym_gate_coord
	db \1, \2, \3, 0
ENDM

DEF HORIZONTAL_GATE_BLOCK EQU $54
DEF VERTICAL_GATE_BLOCK   EQU $5f

CinnabarGymGateCoords:
	; x coord, y coord, block id
	gym_gate_coord 9, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 6, 3, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 6, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 3, 8, VERTICAL_GATE_BLOCK
	gym_gate_coord 2, 6, HORIZONTAL_GATE_BLOCK
	gym_gate_coord 2, 3, HORIZONTAL_GATE_BLOCK
