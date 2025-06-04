Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeaders
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE13_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE13_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE13_END_BATTLE

Route13_TextPointers:
	def_text_pointers
	dw_const Route13CooltrainerM1Text, TEXT_ROUTE13_COOLTRAINER_M1
	dw_const Route13CooltrainerF1Text, TEXT_ROUTE13_COOLTRAINER_F1
	dw_const Route13CooltrainerF2Text, TEXT_ROUTE13_COOLTRAINER_F2
	dw_const Route13CooltrainerF3Text, TEXT_ROUTE13_COOLTRAINER_F3
	dw_const Route13CooltrainerF4Text, TEXT_ROUTE13_COOLTRAINER_F4
	dw_const Route13CooltrainerM2Text, TEXT_ROUTE13_COOLTRAINER_M2
	dw_const Route13Beauty1Text,       TEXT_ROUTE13_BEAUTY1
	dw_const Route13Beauty2Text,       TEXT_ROUTE13_BEAUTY2
	dw_const Route13BikerText,         TEXT_ROUTE13_BIKER
	dw_const Route13CooltrainerM3Text, TEXT_ROUTE13_COOLTRAINER_M3
	dw_const Route13TrainerTips1Text,  TEXT_ROUTE13_TRAINER_TIPS1
	dw_const Route13TrainerTips2Text,  TEXT_ROUTE13_TRAINER_TIPS2
	dw_const Route13SignText,          TEXT_ROUTE13_SIGN

Route13TrainerHeaders:
	def_trainers
Route13TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_0, 2, Route13CooltrainerM1BattleText, Route13CooltrainerM1EndBattleText, Route13CooltrainerM1AfterBattleText
Route13TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_1, 2, Route13CooltrainerF1BattleText, Route13CooltrainerF1EndBattleText, Route13CooltrainerF1AfterBattleText
Route13TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_2, 2, Route13CooltrainerF2BattleText, Route13CooltrainerF2EndBattleText, Route13CooltrainerF2AfterBattleText
Route13TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_3, 2, Route13CooltrainerF3BattleText, Route13CooltrainerF3EndBattleText, Route13CooltrainerF3AfterBattleText
Route13TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_4, 4, Route13CooltrainerF4BattleText, Route13CooltrainerF4EndBattleText, Route13CooltrainerF4AfterBattleText
Route13TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_5, 2, Route13CooltrainerM2BattleText, Route13CooltrainerM2EndBattleText, Route13CooltrainerM2AfterBattleText
Route13TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_6, 4, Route13Beauty1BattleText, Route13Beauty1EndBattleText, Route13Beauty1AfterBattleText
Route13TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_7, 2, Route13Beauty2BattleText, Route13Beauty2EndBattleText, Route13Beauty2AfterBattleText
Route13TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_8, 2, Route13BikerBattleText, Route13BikerEndBattleText, Route13BikerAfterBattleText
Route13TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_9, 4, Route13CooltrainerM3BattleText, Route13CooltrainerM3EndBattleText, Route13CooltrainerM3AfterBattleText
	db -1 ; end

Route13CooltrainerM1Text:
	text_asm
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM1BattleText:
	text "ぼくの　とりポケが　きみたちと"
	line "たたかい　たがってる！"
	done

Route13CooltrainerM1EndBattleText:
	text "ポッポと　ピジョン"
	line "コンビが　まける　なんて"
	prompt

Route13CooltrainerM1AfterBattleText:
	text "まけても　ぼくの　とりポケは"
	line "まんぞく　した　みたい"
	done

Route13CooltrainerF1Text:
	text_asm
	ld hl, Route13TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF1BattleText:
	text "おんなのこに　しては"
	line "すじが　いいって　ほめられるの！"
	done

Route13CooltrainerF1EndBattleText:
	text "まけちゃった"
	prompt

Route13CooltrainerF1AfterBattleText:
	text "いつかは"
	line "つよい　<TRAINER>に　なりたい"
	cont "きょうから　また　とっくんよ！"
	done

Route13CooltrainerF2Text:
	text_asm
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF2BattleText:
	text "あら！"
	line "かっこいい　バッジ　もってるね"
	done

Route13CooltrainerF2EndBattleText:
	text "まだまだ　だわ"
	prompt

Route13CooltrainerF2AfterBattleText:
	text "そのバッジ<……>"
	line "りーダー　から　もらったんでしょ"
	cont "<……>　しってるわよ"
	done

Route13CooltrainerF3Text:
	text_asm
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF3BattleText:
	text "かわいい　#　たちに"
	line "ごあいさつを　させるわ！"
	done

Route13CooltrainerF3EndBattleText:
	text "おみごと！"
	line "わたしの　かんぱいね"
	prompt

Route13CooltrainerF3AfterBattleText:
	text "#は　こうやって"
	line "どんどん　たたかわせて"
	cont "つよく　してかないと！"
	done

Route13CooltrainerF4Text:
	text_asm
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF4BattleText:
	text "どうくつ　たんけんに　いって"
	line "インドメタシンを　ひろったのよ"
	done

Route13CooltrainerF4EndBattleText:
	text "<……>　ざんねん！"
	line "ちょうしが　でなかったわ"
	prompt

Route13CooltrainerF4AfterBattleText:
	text "そう　インドメタシン　あたえたら"
	line "#の　すばやさが　あがったの"
	done

Route13CooltrainerM2Text:
	text_asm
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM2BattleText:
	text "まけないよ！　かぜは"
	line "ぼくの　ほうに　ふいて　いる！"
	done

Route13CooltrainerM2EndBattleText:
	text "<……>　かざむきが"
	line "かわった　みたい　だな"
	prompt

Route13CooltrainerM2AfterBattleText:
	text "たたかう　げんきも　ないや"
	line "とりに　のって　うちに　かえろう"
	done

Route13Beauty1Text:
	text_asm
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty1BattleText:
	text "あら<……>　ぼうや"
	line "あいて　して　あげても　いいわよ"
	done

Route13Beauty1EndBattleText:
	text "つよい！"
	line "おとこ　らしいわね！"
	prompt

Route13Beauty1AfterBattleText:
	text "#の　せかい　では"
	line "オス　と　メス"
	cont "どちらが　つよいの　かしら"
	done

Route13Beauty2Text:
	text_asm
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty2BattleText:
	text "わたしと　#　したいの？"
	done

Route13Beauty2EndBattleText:
	text "<……>　もう"
	line "おわっちゃったのね"
	prompt

Route13Beauty2AfterBattleText:
	text "わたし　ほんとは　#"
	line "よく　わからないの"
	cont "つかう　#も"
	cont "かっこう　だけで　きめちゃうのよ"
	done

Route13BikerText:
	text_asm
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BikerBattleText:
	text "っだよ！　っせーな！"
	done

Route13BikerEndBattleText:
	text "ったくよ！"
	line "っざけんなよ！"
	prompt

Route13BikerAfterBattleText:
	text "っせーな！"
	line "あっち　いけよ！"
	done

Route13CooltrainerM3Text:
	text_asm
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM3BattleText:
	text "ずーッと　とり　#に"
	line "こだわって　きた　ぼくです！"
	done

Route13CooltrainerM3EndBattleText:
	text "ちから　つきた<……>"
	prompt

Route13CooltrainerM3AfterBattleText:
	text "あーあ<……>　ぼくも"
	line "ポッポや　ビジョンの　ように"
	cont "そらを　とんで　いきたい"
	done

Route13TrainerTips1Text:
	text "<……>　おとくな　けいじばん！"

	para "そこ　そこ！"
	line "くいを　はさんで　ひだり　がわ"
	done

Route13TrainerTips2Text:
	text "<……>　おとくな　けいじばん！"

	para "どうぐ　ウィンドウで"
	line "セレクト　ボタンを　おすと"
	cont "どうぐの　ばしょを"
	cont "いれかえる　ことが　できる！"
	done

Route13SignText:
	text "ここは　１３ばん　どうろ"
	line "きた　<……>　サイレンズ　ブりッジ"
	done
