Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10TrainerHeaders
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE10_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE10_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE10_END_BATTLE

Route10_TextPointers:
	def_text_pointers
	dw_const Route10SuperNerd1Text,     TEXT_ROUTE10_SUPER_NERD1
	dw_const Route10Hiker1Text,         TEXT_ROUTE10_HIKER1
	dw_const Route10SuperNerd2Text,     TEXT_ROUTE10_SUPER_NERD2
	dw_const Route10CooltrainerF1Text,  TEXT_ROUTE10_COOLTRAINER_F1
	dw_const Route10Hiker2Text,         TEXT_ROUTE10_HIKER2
	dw_const Route10CooltrainerF2Text,  TEXT_ROUTE10_COOLTRAINER_F2
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_NORTH_SIGN
	dw_const PokeCenterSignText,        TEXT_ROUTE10_POKECENTER_SIGN
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_SOUTH_SIGN
	dw_const Route10PowerPlantSignText, TEXT_ROUTE10_POWERPLANT_SIGN

Route10TrainerHeaders:
	def_trainers
Route10TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_0, 4, Route10SuperNerd1BattleText, Route10SuperNerd1EndBattleText, Route10SuperNerd1AfterBattleText
Route10TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_1, 3, Route10Hiker1BattleText, Route10Hiker1EndBattleText, Route10Hiker1AfterBattleText
Route10TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_2, 4, Route10SuperNerd2BattleText, Route10SuperNerd2EndBattleText, Route10SuperNerd2AfterBattleText
Route10TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_3, 3, Route10CooltrainerF1BattleText, Route10CooltrainerF1EndBattleText, Route10CooltrainerF1AfterBattleText
Route10TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_4, 2, Route10Hiker2BattleText, Route10Hiker2EndBattleText, Route10Hiker2AfterBattleText
Route10TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_10_TRAINER_5, 2, Route10CooltrainerF2BattleText, Route10CooltrainerF2EndBattleText, Route10CooltrainerF2AfterBattleText
	db -1 ; end

Route10SuperNerd1Text:
	text_asm
	ld hl, Route10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd1BattleText:
	text "こんな　とこ　まで　くる　とは"
	line "きみも　マニア？　<……>　じゃ"
	cont "ぼくの　コレクション　みる？"
	done

Route10SuperNerd1EndBattleText:
	text "へーん<……>！"
	line "くやしく　ないよ！"
	prompt

Route10SuperNerd1AfterBattleText:
	text "うちに　かえれば　もっと"
	line "めずらしい　#　あるもん"
	done

Route10Hiker1Text:
	text_asm
	ld hl, Route10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker1BattleText:
	text "はーッ　はっはッ！"
	done

Route10Hiker1EndBattleText:
	text "はッ！"
	line "はーッ　ははッ<……>！　じつは<……>"
	cont "わらい　キノコ　たべて　しまってな"
	prompt

Route10Hiker1AfterBattleText:
	text "はっはッ！"
	line "はーッ　はっ　はッ！"
	cont "<……>　はァ　はァ<……>"
	done

Route10SuperNerd2Text:
	text_asm
	ld hl, Route10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd2BattleText:
	text "ねー　ねー！"
	line "おたく　ぼくの　#　みる？"
	done

Route10SuperNerd2EndBattleText:
	text "ああー！"
	line "だいじな　#　ちゃんが！"
	prompt

Route10SuperNerd2AfterBattleText:
	text "<……>　ぼく　より"
	line "つよい　ヤツは　キライ　だもん"
	done

Route10CooltrainerF1Text:
	text_asm
	ld hl, Route10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF1BattleText:
	text "わたしも　たまに"
	line "#　ジムに　いくの！"
	cont "<……>　<……>　まけちゃう　けどね"
	done

Route10CooltrainerF1EndBattleText:
	text "もお<……>！"
	line "とっくん　したのに"
	prompt

Route10CooltrainerF1AfterBattleText:
	text "ねえ<……>！"
	line "こんな　やま　みちに"
	cont "マニアが　いる　のよ<……>　みた？"
	done

Route10Hiker2Text:
	text_asm
	ld hl, Route10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker2BattleText:
	text "すーはー　すーはー！"
	line "やまの　くうきは　うまいッ！"
	done

Route10Hiker2EndBattleText:
	text "すーはーッ！"
	line "あー　まけたわい！"
	prompt

Route10Hiker2AfterBattleText:
	text "やまの　くうき"
	line "すい　すぎて　はらが　ふくれた！"
	done

Route10CooltrainerF2Text:
	text_asm
	ld hl, Route10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF2BattleText:
	text "はァ<……>！"
	line "やまみち　ひさしぶりに　あるいて"
	cont "ひんけつ　ぎみ　なの"
	done

Route10CooltrainerF2EndBattleText:
	text "<……>　<……>　たいちょうが"
	line "わるいから　しかた　ないわ"
	prompt

Route10CooltrainerF2AfterBattleText:
	text "やまの　#って"
	line "ごついの　ばっかり<……>"
	cont "ピンクの　はながらの"
	cont "#が　いれば　いいのに"
	done

Route10RockTunnelSignText:
	text "ここは　イワヤマ　トンネル"
	done

Route10PowerPlantSignText:
	text "ここは　むじん　はつでんしょ"
	done
