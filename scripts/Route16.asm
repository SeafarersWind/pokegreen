Route16_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route16TrainerHeaders
	ld de, Route16_ScriptPointers
	ld a, [wRoute16CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute16CurScript], a
	ret

Route16ResetScripts:
	xor a ; SCRIPT_ROUTE16_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_ScriptPointers:
	def_script_pointers
	dw_const Route16DefaultScript,                  SCRIPT_ROUTE16_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE16_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE16_END_BATTLE
	dw_const Route16SnorlaxPostBattleScript,        SCRIPT_ROUTE16_SNORLAX_POST_BATTLE

Route16DefaultScript:
	CheckEventHL EVENT_BEAT_ROUTE16_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, TEXT_ROUTE16_SNORLAX_WOKE_UP
	ldh [hTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLevel], a
	ld a, HS_ROUTE_16_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	ld a, SCRIPT_ROUTE16_SNORLAX_POST_BATTLE
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16SnorlaxPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route16ResetScripts
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .caught
	ld a, TEXT_ROUTE16_SNORLAX_RETURNED_TO_MOUNTAINS
	ldh [hTextID], a
	call DisplayTextID
.caught
	SetEvent EVENT_BEAT_ROUTE16_SNORLAX
	call Delay3
	ld a, SCRIPT_ROUTE16_DEFAULT
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_TextPointers:
	def_text_pointers
	dw_const Route16Biker1Text,                     TEXT_ROUTE16_BIKER1
	dw_const Route16Biker2Text,                     TEXT_ROUTE16_BIKER2
	dw_const Route16Biker3Text,                     TEXT_ROUTE16_BIKER3
	dw_const Route16Biker4Text,                     TEXT_ROUTE16_BIKER4
	dw_const Route16Biker5Text,                     TEXT_ROUTE16_BIKER5
	dw_const Route16Biker6Text,                     TEXT_ROUTE16_BIKER6
	dw_const Route16SnorlaxText,                    TEXT_ROUTE16_SNORLAX
	dw_const Route16CyclingRoadSignText,            TEXT_ROUTE16_CYCLING_ROAD_SIGN
	dw_const Route16SignText,                       TEXT_ROUTE16_SIGN
	dw_const Route16SnorlaxWokeUpText,              TEXT_ROUTE16_SNORLAX_WOKE_UP
	dw_const Route16SnorlaxReturnedToMountainsText, TEXT_ROUTE16_SNORLAX_RETURNED_TO_MOUNTAINS

Route16TrainerHeaders:
	def_trainers
Route16TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_0, 3, Route16Biker1BattleText, Route16Biker1EndBattleText, Route16Biker1AfterBattleText
Route16TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_1, 2, Route16Biker2BattleText, Route16Biker2EndBattleText, Route16Biker2AfterBattleText
Route16TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_2, 2, Route16Biker3BattleText, Route16Biker3EndBattleText, Route16Biker3AfterBattleText
Route16TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_3, 2, Route16biker4BattleText, Route16Biker4EndBattleText, Route16Biker4AfterBattleText
Route16TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_4, 2, Route16Biker5BattleText, Route16Biker5EndBattleText, Route16Biker5AfterBattleText
Route16TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_5, 4, Route16Biker6BattleText, Route16Biker6EndBattleText, Route16Biker6AfterBattleText
	db -1 ; end

Route16Biker1Text:
	text_asm
	ld hl, Route16TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker1BattleText:
	text "っだと　こらあ！"
	done

Route16Biker1EndBattleText:
	text "ってんじゃねえぞ！"
	prompt

Route16Biker1AfterBattleText:
	text "っせーな！"
	line "おれたちゃ　はしる　より"
	cont "ここで　だらだら　してる　ほうが"
	cont "たのしいんだよ！"
	done

Route16Biker2Text:
	text_asm
	ld hl, Route16TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker2BattleText:
	text "おう　おうッ！"
	line "その　じてんしゃ　おれに　くれ！"
	done

Route16Biker2EndBattleText:
	text "ノック　アウト！"
	prompt

Route16Biker2AfterBattleText:
	text "もう　いい！"
	line "じてんしゃは　いらねえ！"
	done

Route16Biker3Text:
	text_asm
	ld hl, Route16TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker3BattleText:
	text "かわいがって　やろう！"
	done

Route16Biker3EndBattleText:
	text "この　やろう！"
	prompt

Route16Biker3AfterBattleText:
	text "よくも　やって　くれたな！"
	line "おれは　まけるのが"
	cont "だい　きらい　なんだ！"
	done

Route16Biker4Text:
	text_asm
	ld hl, Route16TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route16biker4BattleText:
	text "こら　まて！"
	line "ぶつかって　おいて　にげるな！"
	done

Route16Biker4EndBattleText:
	text "ボンバー！"
	prompt

Route16Biker4AfterBattleText:
	text "おれたち　いつも　ここに　いるぜ！"
	line "こわかったら　クチバ　から"
	cont "うみぞい　まわって"
	cont "セキチクへ　いくんだな！"
	done

Route16Biker5Text:
	text_asm
	ld hl, Route16TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker5BattleText:
	text "おれは　いま　きげんが　わるい！"
	line "ウサ　ばらしが　してえ！"
	done

Route16Biker5EndBattleText:
	text "なまいきな　こぞうだ！"
	prompt

Route16Biker5AfterBattleText:
	text "どうせ　#　やるなら"
	line "きょうぼうな　やつが　ほしいぜ！"
	cont "それで　あいてを"
	cont "ボロボロに　してやる！"
	done

Route16Biker6Text:
	text_asm
	ld hl, Route16TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker6BattleText:
	text "ひょひょーッ！"
	line "すこし　あそんでって　やるぜ！"
	done

Route16Biker6EndBattleText:
	text "おれを　おこらすなよ！"
	prompt

Route16Biker6AfterBattleText:
	text "おう　おうッ！"
	line "#で　おどかしたり"
	cont "かみつかせたり　いたずら　したり"
	cont "するのが　すきだぜ！"
	done

Route16SnorlaxText:
	text "#が　とても"
	line "きもちよさそうに　ねています"
	done

Route16SnorlaxWokeUpText:
	text "カビゴンは　めを　さました！"

	para "ねぼけた　カビゴンが"
	line "おそってきた！"
	done

Route16SnorlaxReturnedToMountainsText:
	text "カビゴンは　おおきな　あくびをして"
	line "やまのおくへ　さっていった<……>"
	done

Route16CyclingRoadSignText:
	text "さかみちを　たのしもう！"
	line "サイクりング　ロード！"
	done

Route16SignText:
	text "ここは　１６ばん　どうろ"
	line "タマムシ　<……>　セキチク"
	done
