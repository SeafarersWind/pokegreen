Route4_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4_ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE4_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE4_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE4_END_BATTLE

Route4_TextPointers:
	def_text_pointers
	dw_const Route4CooltrainerF1Text, TEXT_ROUTE4_COOLTRAINER_F1
	dw_const Route4CooltrainerF2Text, TEXT_ROUTE4_COOLTRAINER_F2
	dw_const PickUpItemText,          TEXT_ROUTE4_TM_WHIRLWIND
	dw_const PokeCenterSignText,      TEXT_ROUTE4_POKECENTER_SIGN
	dw_const Route4MtMoonSignText,    TEXT_ROUTE4_MT_MOON_SIGN
	dw_const Route4SignText,          TEXT_ROUTE4_SIGN

Route4TrainerHeaders:
	def_trainers 2
Route4TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_0, 3, Route4CooltrainerF2BattleText, Route4CooltrainerF2EndBattleText, Route4CooltrainerF2AfterBattleText
	db -1 ; end

Route4CooltrainerF1Text:
	text "いたッ！"
	line "つまづいて　ころんじゃった"
	cont "#の　イシツブテだわ！"
	done

Route4CooltrainerF2Text:
	text_asm
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route4CooltrainerF2BattleText:
	text "わたし　オツキミやまに"
	line "キノコの　#　とりに　きたの！"
	done

Route4CooltrainerF2EndBattleText:
	text "せっかく　とったのに！"
	prompt

Route4CooltrainerF2AfterBattleText:
	text "このあたりは"
	line "もう　キノコ　みつかんないかも"

	para "だって　あたしが"
	line "ぜんぶ　とっちゃったもん"
	done

Route4MtMoonSignText:
	text "ここは　オツキミやま"
	line "<……>　どうくつ　いりぐち"
	done

Route4SignText:
	text "ここは　４ばん　どうろ"
	line "オツキミやま　<……>　ハナダ　シティ"
	done
