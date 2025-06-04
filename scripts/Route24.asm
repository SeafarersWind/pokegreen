Route24_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route24TrainerHeaders
	ld de, Route24_ScriptPointers
	ld a, [wRoute24CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute24CurScript], a
	ret

Route24SetDefaultScript:
	xor a ; SCRIPT_ROUTE24_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_ScriptPointers:
	def_script_pointers
	dw_const Route24DefaultScript,                  SCRIPT_ROUTE24_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE24_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE24_END_BATTLE
	dw_const Route24AfterRocketBattleScript,        SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	dw_const Route24PlayerMovingScript,             SCRIPT_ROUTE24_PLAYER_MOVING

Route24DefaultScript:
	CheckEvent EVENT_GOT_NUGGET
	jp nz, CheckFightingMapTrainers
	ld hl, .PlayerCoordsArray
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	CheckAndResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	ret z
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE24_PLAYER_MOVING
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

.PlayerCoordsArray:
	dbmapcoord 10, 15
	db -1 ; end

Route24PlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24AfterRocketBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route24SetDefaultScript
	call UpdateSprites
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE24_ROCKET
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_TextPointers:
	def_text_pointers
	dw_const Route24CooltrainerM1Text, TEXT_ROUTE24_COOLTRAINER_M1
	dw_const Route24CooltrainerM2Text, TEXT_ROUTE24_COOLTRAINER_M2
	dw_const Route24CooltrainerM3Text, TEXT_ROUTE24_COOLTRAINER_M3
	dw_const Route24CooltrainerF1Text, TEXT_ROUTE24_COOLTRAINER_F1
	dw_const Route24Youngster1Text,    TEXT_ROUTE24_YOUNGSTER1
	dw_const Route24CooltrainerF2Text, TEXT_ROUTE24_COOLTRAINER_F2
	dw_const Route24Youngster2Text,    TEXT_ROUTE24_YOUNGSTER2
	dw_const PickUpItemText,           TEXT_ROUTE24_TM_THUNDER_WAVE

Route24TrainerHeaders:
	def_trainers 2
Route24TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_0, 4, Route24CooltrainerM2BattleText, Route24CooltrainerM2EndBattleText, Route24CooltrainerM2AfterBattleText
Route24TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_1, 1, Route24CooltrainerM3BattleText, Route24CooltrainerM3EndBattleText, Route24CooltrainerM3AfterBattleText
Route24TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_2, 1, Route24CooltrainerF1BattleText, Route24CooltrainerF1EndBattleText, Route24CooltrainerF1AfterBattleText
Route24TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_3, 1, Route24Youngster1BattleText, Route24Youngster1EndBattleText, Route24Youngster1AfterBattleText
Route24TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_4, 1, Route24CooltrainerF2BattleText, Route24CooltrainerF2EndBattleText, Route24CooltrainerF2AfterBattleText
Route24TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_24_TRAINER_5, 1, Route24Youngster2BattleText, Route24Youngster2EndBattleText, Route24Youngster2AfterBattleText
	db -1 ; end

Route24CooltrainerM1Text:
	text_asm
	ResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	CheckEvent EVENT_GOT_NUGGET
	jr nz, .got_item
	ld hl, .YouBeatOurContestText
	call PrintText
	lb bc, NUGGET, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_NUGGET
	ld hl, .ReceivedNuggetText
	call PrintText
	ld hl, .JoinTeamRocketText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .DefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd
.got_item
	ld hl, .YouCouldBecomeATopLeaderText
	call PrintText
	jp TextScriptEnd
.bag_full
	ld hl, .NoRoomText
	call PrintText
	SetEvent EVENT_NUGGET_REWARD_AVAILABLE
	jp TextScriptEnd

.YouBeatOurContestText:
	text "おみごとーッ！"
	line "５にんぬき　おめでとう！@"
	sound_get_item_1
	text_start

	para "しょうひんに"
	line "これを　プレゼント　しよう！"
	prompt

.ReceivedNuggetText:
	text "<PLAYER>は　なぞの<TRAINER>から"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_item_1
	text_promptbutton
	text_end

.NoRoomText:
	text "もちものが　いっぱいだ"
	done

.JoinTeamRocketText:
	text "ところで<……>　ここだけの　はなし"
	line "<ROCKET>に　はいらない？"

	para "おれたちは"
	line "#を　わるいことに"
	cont "つかおうっていう　グループだ！"

	para "はいりなよ"

	para "はいらないの？"

	para "はいってよ！"

	para "はいれよ！"

	para "<……>　ことわるって　かお　してんな"

	para "それなら<……>！"
	line "むりやり　いれて　やる！"
	cont "うりゃーッ！"
	done

.DefeatedText:
	text "こぞう<……>！"
	line "ホント　つええな！"
	prompt

.YouCouldBecomeATopLeaderText:
	text "それだけの　うでが　あれば"
	line "<ROCKET>　でも"
	cont "えらく　なれるのに　もったいないぜ！"
	done

Route24CooltrainerM2Text:
	text_asm
	ld hl, Route24TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM2BattleText:
	text "ふふ<……>ッ！　くさむらから"
	line "きみの　かつやくを　みてたよ"
	done

Route24CooltrainerM2EndBattleText:
	text "<……>　やっぱり　だめだ"
	prompt

Route24CooltrainerM2AfterBattleText:
	text "<……>　はしを　わたるのが　こわくて"
	line "ずっと　ここに　かくれてたんだ"
	done

Route24CooltrainerM3Text:
	text_asm
	ld hl, Route24TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM3BattleText:
	text "きえーいッ！　５にんめ！"
	line "おれが　あいてだあ！"
	done

Route24CooltrainerM3EndBattleText:
	text "たいした　もんだ！"
	prompt

Route24CooltrainerM3AfterBattleText:
	text "べストを　つくしたんだ"
	line "くいは　ない！"
	done

Route24CooltrainerF1Text:
	text_asm
	ld hl, Route24TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF1BattleText:
	text "４にんめは　わたしよ！"
	line "そろそろ　ばてて"
	cont "きたんじゃない？"
	done

Route24CooltrainerF1EndBattleText:
	text "わたしも　まけたのね"
	prompt

Route24CooltrainerF1AfterBattleText:
	text "べストを　つくしたんだから"
	line "くいは　ないわ！"
	done

Route24Youngster1Text:
	text_asm
	ld hl, Route24TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster1BattleText:
	text "３にんめ　とうじょう！"
	line "そう　かんたんには　いかないぜ！"
	done

Route24Youngster1EndBattleText:
	text "へろへろ　もう　ダメ"
	prompt

Route24Youngster1AfterBattleText:
	text "べストを　つくしたんだ"
	line "くいは　ない！"
	done

Route24CooltrainerF2Text:
	text_asm
	ld hl, Route24TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF2BattleText:
	text "ふたりめは　わたし！"
	line "これからが　ほんばん　よ！"
	done

Route24CooltrainerF2EndBattleText:
	text "しんじらんなーい"
	prompt

Route24CooltrainerF2AfterBattleText:
	text "べストを　つくしたんだから"
	line "くいは　ないわ！"
	done

Route24Youngster2Text:
	text_asm
	ld hl, Route24TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster2BattleText:
	text "この　はしは　ひと　よんで"
	line "ゴールデンボール　ブりッジ！"

	para "５にん　かちぬけば"
	line "ごうかな　しょうひんが　もらえる！"

	para "さて！"
	line "おまえに　ぬけられるかな？"
	done

Route24Youngster2EndBattleText:
	text "なかなか　やるじゃん"
	prompt

Route24Youngster2AfterBattleText:
	text "べストを　つくしたんだ"
	line "くいは　ない！"
	done
