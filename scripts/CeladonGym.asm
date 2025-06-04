CeladonGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGymTrainerHeaders
	ld de, CeladonGym_ScriptPointers
	ld a, [wCeladonGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "タマムシ@"

.LeaderName:
	db "エりカ@"

CeladonGymResetScripts:
	xor a ; SCRIPT_CELADONGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
	ret

CeladonGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CELADONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CELADONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CELADONGYM_END_BATTLE
	dw_const CeladonGymErikaPostBattleScript,       SCRIPT_CELADONGYM_ERIKA_POST_BATTLE

CeladonGymErikaPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGymResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a

CeladonGymReceiveTM21:
	ld a, TEXT_CELADONGYM_RAINBOWBADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_ERIKA
	lb bc, TM_MEGA_DRAIN, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_CELADONGYM_RECEIVED_TM21
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM21
	jr .gymVictory
.BagFull
	ld a, TEXT_CELADONGYM_TM21_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_RAINBOWBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_RAINBOWBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CELADON_GYM_TRAINER_0, EVENT_BEAT_CELADON_GYM_TRAINER_6

	jp CeladonGymResetScripts

CeladonGym_TextPointers:
	def_text_pointers
	dw_const CeladonGymErikaText,            TEXT_CELADONGYM_ERIKA
	dw_const CeladonGymCooltrainerF1Text,    TEXT_CELADONGYM_COOLTRAINER_F1
	dw_const CeladonGymBeauty1Text,          TEXT_CELADONGYM_BEAUTY1
	dw_const CeladonGymCooltrainerF2Text,    TEXT_CELADONGYM_COOLTRAINER_F2
	dw_const CeladonGymBeauty2Text,          TEXT_CELADONGYM_BEAUTY2
	dw_const CeladonGymCooltrainerF3Text,    TEXT_CELADONGYM_COOLTRAINER_F3
	dw_const CeladonGymBeauty3Text,          TEXT_CELADONGYM_BEAUTY3
	dw_const CeladonGymCooltrainerF4Text,    TEXT_CELADONGYM_COOLTRAINER_F4
	dw_const CeladonGymRainbowBadgeInfoText, TEXT_CELADONGYM_RAINBOWBADGE_INFO
	dw_const CeladonGymReceivedTM21Text,     TEXT_CELADONGYM_RECEIVED_TM21
	dw_const CeladonGymTM21NoRoomText,       TEXT_CELADONGYM_TM21_NO_ROOM

CeladonGymTrainerHeaders:
	def_trainers 2
CeladonGymTrainerHeader0:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_0, 2, CeladonGymBattleText2, CeladonGymEndBattleText2, CeladonGymAfterBattleText2
CeladonGymTrainerHeader1:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_1, 2, CeladonGymBattleText3, CeladonGymEndBattleText3, CeladonGymAfterBattleText3
CeladonGymTrainerHeader2:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_2, 4, CeladonGymBattleText4, CeladonGymEndBattleText4, CeladonGymAfterBattleText4
CeladonGymTrainerHeader3:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_3, 4, CeladonGymBattleText5, CeladonGymEndBattleText5, CeladonGymAfterBattleText5
CeladonGymTrainerHeader4:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_4, 2, CeladonGymBattleText6, CeladonGymEndBattleText6, CeladonGymAfterBattleText6
CeladonGymTrainerHeader5:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_5, 2, CeladonGymBattleText7, CeladonGymEndBattleText7, CeladonGymAfterBattleText7
CeladonGymTrainerHeader6:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_6, 3, CeladonGymBattleText8, CeladonGymEndBattleText8, CeladonGymAfterBattleText8
	db -1 ; end

CeladonGymErikaText:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM21
	jr nz, .afterBeat
	call z, CeladonGymReceiveTM21
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .PostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedRainbowBadgeText
	ld de, .ReceivedRainbowBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wGymLeaderNo], a
	ld a, SCRIPT_CELADONGYM_ERIKA_POST_BATTLE
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd

.PreBattleText:
	text "はあーい<……>"
	line "よい　おてんきね"
	cont "きもち　いい<……>"

	para "<……>　すー<……>　すー"
	line "<……>　あら　いけない"
	cont "ねて　しまったわ<……>　ようこそ"

	para "わたくし　タマムシ　ジムの"
	line "エりカと　もうします"

	para "おはなを　いけるのが　しゅみで"
	line "#は　くさタイプ　ばかり"

	para "<……>　あら　やだ"
	line "しあいの　もうしこみ　ですの？"

	para "そんな<……>"
	line "わたくし　まけませんわよ"
	done

.ReceivedRainbowBadgeText:
	text "<……>！"
	line "まいり　ましたわ"

	para "さすが"
	line "とのがたは　おつよい　ですわ"

	para "この　レインボーバッジ"
	line "さしあげ　なくては　なりませんね"
	prompt

.PostBattleAdviceText:
	text "あら　まあ<……>"
	line "ずかんを　つくって　ますのね"
	cont "ほんとに　えらいわ"

	para "わたし　でしたら"
	line "きれいな　#しか"
	cont "ほしく　なりません　もの"
	done

CeladonGymRainbowBadgeInfoText:
	text "レインボー　バッジで"
	line "レべル５０　までの　#が"
	cont "おとなしく　いうこと　きき　ます"

	para "そして<……>　かいりきの　わざが"
	line "たたかって　なくても　つかえます"

	para "それから<……>"
	line "よろしかったら"
	cont "これも　おつかいに　なって！"
	done

CeladonGymReceivedTM21Text:
	text "<PLAYER>は　エりカ　から"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_item_1
	text_start

	para "<TM>２１の　なかは"
	line "メガドレイン　です"

	para "あたえた　ダメージの　はんぶんが"
	line "#の　えいように　なる"
	cont "すばらしい　わざ　です"
	done

CeladonGymTM21NoRoomText:
	text "おにもつ　いっぱい"
	done

CeladonGymCooltrainerF1Text:
	text_asm
	ld hl, CeladonGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText2:
	text "あッ！　おとこ！"

	para "ここは　ねー！　おんなのこ　しか"
	line "はいっちゃ　いけないの！"
	done

CeladonGymEndBattleText2:
	text "らんぼう　なんだから"
	prompt

CeladonGymAfterBattleText2:
	text "べー！"
	line "エりカさんに"
	cont "やられ　ちゃえば　いいのよ"
	done

CeladonGymBeauty1Text:
	text_asm
	ld hl, CeladonGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText3:
	text "あら！"
	line "おんな　ばっかりで"
	cont "たいくつ　してたのよ！"
	done

CeladonGymEndBattleText3:
	text "やんなっちゃう"
	prompt

CeladonGymAfterBattleText3:
	text "くさに　よわい　のは"
	line "みず　タイプ　だけ　じゃ　ないわ"

	para "じめん　タイプ　と　いわ　タイプも"
	line "わたし　たちの　えじきよ！"
	done

CeladonGymCooltrainerF2Text:
	text_asm
	ld hl, CeladonGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText4:
	text "あれー！　あんた　さっき"
	line "ここ　のぞいてた　おとこ　じゃない？"
	done

CeladonGymEndBattleText4:
	text "おめめ　ぱちくり"
	prompt

CeladonGymAfterBattleText4:
	text "あんた"
	line "ほんとに　のぞき　じゃない？"
	cont "さいきん　おおい　のよ"
	done

CeladonGymBeauty2Text:
	text_asm
	ld hl, CeladonGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText5:
	text "ねえ<……>　みて！"
	line "これ　わたしの　#！"

	para "くさ　タイプは　そだてる　のが"
	line "らくな　ところが　いいわ"
	done

CeladonGymEndBattleText5:
	text "やーん！"
	prompt

CeladonGymAfterBattleText5:
	text "うちの　ジムは　つかう　#"
	line "ぜーんぶ　くさ　タイプ！"

	para "だって　#の　ほかに"
	line "いけばな　きょうしつ　やってるから"
	done

CeladonGymCooltrainerF3Text:
	text_asm
	ld hl, CeladonGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText6:
	text "こら！　むし　#　とか"
	line "ほのお　#　は　きらい　なの"
	cont "ここに　もち　こまないでよ！"
	done

CeladonGymEndBattleText6:
	text "あ！　こいつう！"
	prompt

CeladonGymAfterBattleText6:
	text "きみねー！　りーダーの　エりカさんは"
	line "おしとやか　だけど　このへん　じゃ"
	cont "ゆうめいな　<TRAINER>　なんだから！"
	done

CeladonGymBeauty3Text:
	text_asm
	ld hl, CeladonGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText7:
	text "あなた　ごしゅみは<……>？"
	line "<……>　はい！"
	cont "#を　しょうしょう"
	done

CeladonGymEndBattleText7:
	text "けっこうな　おてまえで"
	prompt

CeladonGymAfterBattleText7:
	text "わたし　らいしゅう　おみあい　なの"
	line "#　さそわれても　はしたない"
	cont "たたかい　しない　ように　しなきゃ"
	done

CeladonGymCooltrainerF4Text:
	text_asm
	ld hl, CeladonGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText8:
	text "タマムシ　ジムに　ようこそ！"

	para "おんなのこ　だからって"
	line "ゆだん　しない　ほうが　いいわよ！"
	done

CeladonGymEndBattleText8:
	text "やる　じゃない！"
	prompt

CeladonGymAfterBattleText8:
	text "きょうは　つよい　#"
	line "もって　こなかった　から<……>"

	para "こんど　やる　ときは　まけないわ"
	done
