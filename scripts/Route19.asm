Route19_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route19TrainerHeaders
	ld de, Route19_ScriptPointers
	ld a, [wRoute19CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute19CurScript], a
	ret

Route19_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE19_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE19_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE19_END_BATTLE

Route19_TextPointers:
	def_text_pointers
	dw_const Route19CooltrainerM1Text, TEXT_ROUTE19_COOLTRAINER_M1
	dw_const Route19CooltrainerM2Text, TEXT_ROUTE19_COOLTRAINER_M2
	dw_const Route19Swimmer1Text,      TEXT_ROUTE19_SWIMMER1
	dw_const Route19Swimmer2Text,      TEXT_ROUTE19_SWIMMER2
	dw_const Route19Swimmer3Text,      TEXT_ROUTE19_SWIMMER3
	dw_const Route19Swimmer4Text,      TEXT_ROUTE19_SWIMMER4
	dw_const Route19Swimmer5Text,      TEXT_ROUTE19_SWIMMER5
	dw_const Route19Swimmer6Text,      TEXT_ROUTE19_SWIMMER6
	dw_const Route19Swimmer7Text,      TEXT_ROUTE19_SWIMMER7
	dw_const Route19Swimmer8Text,      TEXT_ROUTE19_SWIMMER8
	dw_const Route19SignText,          TEXT_ROUTE19_SIGN

Route19TrainerHeaders:
	def_trainers
Route19TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_0, 4, Route19CooltrainerM1BattleText, Route19CooltrainerM1EndBattleText, Route19CooltrainerM1AfterBattleText
Route19TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_1, 3, Route19CooltrainerM2BattleText, Route19CooltrainerM2EndBattleText, Route19CooltrainerM2AfterBattleText
Route19TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_2, 3, Route19Swimmer1BattleText, Route19Swimmer1EndBattleText, Route19Swimmer1AfterBattleText
Route19TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_3, 4, Route19Swimmer2BattleText, Route19Swimmer2EndBattleText, Route19Swimmer2AfterBattleText
Route19TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_4, 4, Route19Swimmer3BattleText, Route19Swimmer3EndBattleText, Route19Swimmer3AfterBattleText
Route19TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_5, 4, Route19Swimmer4BattleText, Route19Swimmer4EndBattleText, Route19Swimmer4AfterBattleText
Route19TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_6, 3, Route19Swimmer5BattleText, Route19Swimmer5EndBattleText, Route19Swimmer5AfterBattleText
Route19TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_7, 4, Route19Swimmer6BattleText, Route19Swimmer6EndBattleText, Route19Swimmer6AfterBattleText
Route19TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_8, 4, Route19Swimmer7BattleText, Route19Swimmer7EndBattleText, Route19Swimmer7AfterBattleText
Route19TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_9, 4, Route19Swimmer8BattleText, Route19Swimmer8EndBattleText, Route19Swimmer8AfterBattleText
	db -1 ; end

Route19CooltrainerM1Text:
	text_asm
	ld hl, Route19TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route19CooltrainerM1BattleText:
	text "みずに　はいる　まえに"
	line "じゅんび　たいそう　しなきゃ！"
	done

Route19CooltrainerM1EndBattleText:
	text "たいそう　おわり！"
	prompt

Route19CooltrainerM1AfterBattleText:
	text "よしッ！　おかげで"
	line "いい　うんどうに　なった！"
	done

Route19CooltrainerM2Text:
	text_asm
	ld hl, Route19TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route19CooltrainerM2BattleText:
	text "まて　あわてるな！"
	line "しんぞう　マヒに　なったら　どうする"
	done

Route19CooltrainerM2EndBattleText:
	text "うー　さむい"
	prompt

Route19CooltrainerM2AfterBattleText:
	text "メノクラゲに　さされないよう"
	line "きを　つけて　およげよ！"
	done

Route19Swimmer1Text:
	text_asm
	ld hl, Route19TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer1BattleText:
	text "およぐの　だいすき！"
	line "<……>　きみは　どうなの？"
	done

Route19Swimmer1EndBattleText:
	text "ドッポーン！"
	prompt

Route19Swimmer1AfterBattleText:
	text "およぎ　なら"
	line "うみの　#にも　まけない！"
	done

Route19Swimmer2Text:
	text_asm
	ld hl, Route19TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer2BattleText:
	text "すいへいせんの　むこう"
	line "<……>　なにが　あるんだろ？"
	done

Route19Swimmer2EndBattleText:
	text "ありゃりゃ<……>"
	prompt

Route19Swimmer2AfterBattleText:
	text "<……>　むこうに"
	line "いくつか　しまが　みえるぞ！"
	done

Route19Swimmer3Text:
	text_asm
	ld hl, Route19TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer3BattleText:
	text "もぐって<……>　うみ　#"
	line "とろうとしたけど　だめ　みたいだ！"
	done

Route19Swimmer3EndBattleText:
	text "ごぼ　ごぼッ"
	prompt

Route19Swimmer3AfterBattleText:
	text "うみの　#は　やっぱり"
	line "つりで　とる　しか　ないや"
	done

Route19Swimmer4Text:
	text_asm
	ld hl, Route19TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer4BattleText:
	text "あおい　うみを　みてれば"
	line "いやな　ことも　わすれるぞ！"
	done

Route19Swimmer4EndBattleText:
	text "いやな　まけかただ"
	prompt

Route19Swimmer4AfterBattleText:
	text "あおい　うみを　みて<……>"
	line "いやな　ことを　わすれよう"
	done

Route19Swimmer5Text:
	text_asm
	ld hl, Route19TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer5BattleText:
	text "ま！　いい　ものに　のってるわね"
	line "かったら　わたしに　ちょうだい！"
	done

Route19Swimmer5EndBattleText:
	text "わたしの　まけか"
	prompt

Route19Swimmer5AfterBattleText:
	text "ふたごじま　まで"
	line "まだ　ありそうだし<……>"
	cont "セキチクに　かえりたいわ"
	done

Route19Swimmer6Text:
	text_asm
	ld hl, Route19TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer6BattleText:
	text "およぐの　すき　だけど"
	line "ひやけ　するのは　いやだわ！"
	done

Route19Swimmer6EndBattleText:
	text "くらくら<……>"
	prompt

Route19Swimmer6AfterBattleText:
	text "かれが　ふたごじま　まで"
	line "およごうって　いったのよ"
	done

Route19Swimmer7Text:
	text_asm
	ld hl, Route19TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer7BattleText:
	text "そこの　しょうねん！"
	line "この　うみは　きけんだ！"
	done

Route19Swimmer7EndBattleText:
	text "あぶない　めに　あった"
	prompt

Route19Swimmer7AfterBattleText:
	text "あ　あしが　つった！"
	line "ぶく<……>　ぶくぶく<……>"
	done

Route19Swimmer8Text:
	text_asm
	ld hl, Route19TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer8BattleText:
	text "みんなで　ここまで　およいで"
	line "きたけど<……>　くたびれたわ"
	done

Route19Swimmer8EndBattleText:
	text "つかれた<……>"
	prompt

Route19Swimmer8AfterBattleText:
	text "うみで　#に　のるなら"
	line "ラプラスが　いいわ"
	cont "おおきいから　ぬれない　もの"
	done

Route19SignText:
	text "ここは　１９ばん　すいどう"
	line "セキチク　<……>　ふたごじま"
	done
