Route9_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route9TrainerHeaders
	ld de, Route9_ScriptPointers
	ld a, [wRoute9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute9CurScript], a
	ret

Route9_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE9_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE9_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE9_END_BATTLE

Route9_TextPointers:
	def_text_pointers
	dw_const Route9CooltrainerF1Text, TEXT_ROUTE9_COOLTRAINER_F1
	dw_const Route9CooltrainerM1Text, TEXT_ROUTE9_COOLTRAINER_M1
	dw_const Route9CooltrainerM2Text, TEXT_ROUTE9_COOLTRAINER_M2
	dw_const Route9CooltrainerF2Text, TEXT_ROUTE9_COOLTRAINER_F2
	dw_const Route9Hiker1Text,        TEXT_ROUTE9_HIKER1
	dw_const Route9Hiker2Text,        TEXT_ROUTE9_HIKER2
	dw_const Route9Youngster1Text,    TEXT_ROUTE9_YOUNGSTER1
	dw_const Route9Hiker3Text,        TEXT_ROUTE9_HIKER3
	dw_const Route9Youngster2Text,    TEXT_ROUTE9_YOUNGSTER2
	dw_const PickUpItemText,          TEXT_ROUTE9_TM_TELEPORT
	dw_const Route9SignText,          TEXT_ROUTE9_SIGN

Route9TrainerHeaders:
	def_trainers
Route9TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_0, 3, Route9CooltrainerF1BattleText, Route9CooltrainerF1EndBattleText, Route9CooltrainerF1AfterBattleText
Route9TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_1, 2, Route9CooltrainerM1BattleText, Route9CooltrainerM1EndBattleText, Route9CooltrainerM1AfterBattleText
Route9TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_2, 4, Route9CooltrainerM2BattleText, Route9CooltrainerM2EndBattleText, Route9CooltrainerM2AfterBattleText
Route9TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_3, 2, Route9CooltrainerF2BattleText, Route9CooltrainerF2EndBattleText, Route9CooltrainerF2AfterBattleText
Route9TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_4, 2, Route9Hiker1BattleText, Route9Hiker1EndBattleText, Route9Hiker1AfterBattleText
Route9TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_5, 3, Route9Hiker2BattleText, Route9Hiker2EndBattleText, Route9Hiker2AfterBattleText
Route9TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_6, 4, Route9Youngster1BattleText, Route9Youngster1EndBattleText, Route9Youngster1AfterBattleText
Route9TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_7, 2, Route9Hiker3BattleText, Route9Hiker3EndBattleText, Route9Hiker3AfterBattleText
Route9TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_8, 2, Route9Youngster2BattleText, Route9Youngster2EndBattleText, Route9Youngster2AfterBattleText
	db -1 ; end

Route9CooltrainerF1Text:
	text_asm
	ld hl, Route9TrainerHeader0
	jr Route9TalkToTrainer

Route9CooltrainerM1Text:
	text_asm
	ld hl, Route9TrainerHeader1
	jr Route9TalkToTrainer

Route9CooltrainerM2Text:
	text_asm
	ld hl, Route9TrainerHeader2
	jr Route9TalkToTrainer

Route9CooltrainerF2Text:
	text_asm
	ld hl, Route9TrainerHeader3
	jr Route9TalkToTrainer

Route9Hiker1Text:
	text_asm
	ld hl, Route9TrainerHeader4
	jr Route9TalkToTrainer

Route9Hiker2Text:
	text_asm
	ld hl, Route9TrainerHeader5
	jr Route9TalkToTrainer

Route9Youngster1Text:
	text_asm
	ld hl, Route9TrainerHeader6
	jr Route9TalkToTrainer

Route9Hiker3Text:
	text_asm
	ld hl, Route9TrainerHeader7
	jr Route9TalkToTrainer

Route9Youngster2Text:
	text_asm
	ld hl, Route9TrainerHeader8
Route9TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route9CooltrainerF1BattleText:
	text "あら　#　もってるわね"
	line "<……>　カモ　だわ！"
	done

Route9CooltrainerF1EndBattleText:
	text "あら？　つよいわね"
	prompt

Route9CooltrainerF1AfterBattleText:
	text "この　さきの　トンネル"
	line "なかは　まっくら　だから"
	cont "あかりが　ないと　すすめ　ないわ"
	done

Route9CooltrainerM1BattleText:
	text "だれだ？"
	line "よさげな　#　もって"
	cont "ふらふら　あるいとる　おまえは？"
	done

Route9CooltrainerM1EndBattleText:
	text "まけよった"
	prompt

Route9CooltrainerM1AfterBattleText:
	text "くやしくて　なみだも　でん"
	done

Route9CooltrainerM2BattleText:
	text "イワヤマ　トンネル　ぬけて"
	line "シオン　タウンに"
	cont "いく　ところ　なんだ　けど<……>"
	done

Route9CooltrainerM2EndBattleText:
	text "どうも　だめだな"
	prompt

Route9CooltrainerM2AfterBattleText:
	text "なんだい　きみも"
	line "イワヤマ　トンネル　いくのか"
	done

Route9CooltrainerF2BattleText:
	text "おんなのこ　だからって"
	line "てかげんは　なしね！"
	done

Route9CooltrainerF2EndBattleText:
	text "だめ！　かなわないわ"
	prompt

Route9CooltrainerF2AfterBattleText:
	text "あなた　きっと"
	line "#の　さいのう　あるのよ"
	cont "がんばってね！"
	done

Route9Hiker1BattleText:
	text "がはは！"
	line "ちょうど　いい！"
	cont "たいくつ　してた　とこだ"
	done

Route9Hiker1EndBattleText:
	text "まだまだ！"
	line "<……>　と　おもったら"
	cont "もう　#が　ない"
	prompt

Route9Hiker1AfterBattleText:
	text "やまおとこに"
	line "びびらずに　たたかうとは"
	cont "たいした　もんだ！"
	done

Route9Hiker2BattleText:
	text "はーっはっはッ！"
	line "げんきな　ぼうず　だ！"
	cont "いっちょう　やったるか！"
	done

Route9Hiker2EndBattleText:
	text "おっとっと！"
	prompt

Route9Hiker2AfterBattleText:
	text "はーっはっはッ！"
	line "げんきで　けっこう！"
	done

Route9Youngster1BattleText:
	text "まいあさ　はやおき　して"
	line "そだてた　さなぎが！"
	cont "やっと　かえったんだ！"
	done

Route9Youngster1EndBattleText:
	text "えーッ！"

	para "ぼくの　はやおきは"
	line "いったい　なんだったんだあ"
	prompt

Route9Youngster1AfterBattleText:
	text "つよく　なるには　むし　#の"
	line "ほかも　さがさないと　ダメ　だな"
	done

Route9Hiker3BattleText:
	text "はっはっはーッ！"
	line "かかって　こーい！"
	done

Route9Hiker3EndBattleText:
	text "はーっはっはッ！"
	line "ありゃ　まけた　ようだな"
	prompt

Route9Hiker3AfterBattleText:
	text "はっはっはーッ！"
	line "やまおとこは　こころが　ひろいから"
	cont "まけても　わらってるのだ！"
	done

Route9Youngster2BattleText:
	text "おいらの　かわいい　むし　ポケ！"
	line "それいけー！"
	done

Route9Youngster2EndBattleText:
	text "おいらの　むし<……>"
	prompt

Route9Youngster2AfterBattleText:
	text "むし　#の　よさが"
	line "わからない　やつは　むし！"
	done

Route9SignText:
	text "ここは　９ばん　どうろ"
	line "ハナダ　<……>　イワヤマ　トンネル"
	done
