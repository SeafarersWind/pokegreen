Route8_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8TrainerHeaders
	ld de, Route8_ScriptPointers
	ld a, [wRoute8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute8CurScript], a
	ret

Route8_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE8_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE8_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE8_END_BATTLE

Route8_TextPointers:
	def_text_pointers
	dw_const Route8SuperNerd1Text,      TEXT_ROUTE8_SUPER_NERD1
	dw_const Route8Gambler1Text,        TEXT_ROUTE8_GAMBLER1
	dw_const Route8SuperNerd2Text,      TEXT_ROUTE8_SUPER_NERD2
	dw_const Route8CooltrainerF1Text,   TEXT_ROUTE8_COOLTRAINER_F1
	dw_const Route8SuperNerd3Text,      TEXT_ROUTE8_SUPER_NERD3
	dw_const Route8CooltrainerF2Text,   TEXT_ROUTE8_COOLTRAINER_F2
	dw_const Route8CooltrainerF3Text,   TEXT_ROUTE8_COOLTRAINER_F3
	dw_const Route8Gambler2Text,        TEXT_ROUTE8_GAMBLER2
	dw_const Route8CooltrainerF4Text,   TEXT_ROUTE8_COOLTRAINER_F4
	dw_const Route8UndergroundSignText, TEXT_ROUTE8_UNDERGROUND_SIGN

Route8TrainerHeaders:
	def_trainers
Route8TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_0, 4, Route8SuperNerd1BattleText, Route8SuperNerd1EndBattleText, Route8SuperNerd1AfterBattleText
Route8TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_1, 4, Route8Gambler1BattleText, Route8Gambler1EndBattleText, Route8Gambler1AfterBattleText
Route8TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_2, 4, Route8SuperNerd2BattleText, Route8SuperNerd2EndBattleText, Route8SuperNerd2AfterBattleText
Route8TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_3, 2, Route8CooltrainerF1BattleText, Route8CooltrainerF1EndBattleText, Route8CooltrainerF1AfterBattleText
Route8TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_4, 3, Route8SuperNerd3BattleText, Route8SuperNerd3EndBattleText, Route8SuperNerd3AfterBattleText
Route8TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_5, 3, Route8CooltrainerF2BattleText, Route8CooltrainerF2EndBattleText, Route8CooltrainerF2AfterBattleText
Route8TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_6, 2, Route8CooltrainerF3BattleText, Route8CooltrainerF3EndBattleText, Route8CooltrainerF3AfterBattleText
Route8TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_7, 2, Route8Gambler2BattleText, Route8Gambler2EndBattleText, Route8Gambler2AfterBattleText
Route8TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_8, 4, Route8CooltrainerF4BattleText, Route8CooltrainerF4EndBattleText, Route8CooltrainerF4AfterBattleText
	db -1 ; end

Route8SuperNerd1Text:
	text_asm
	ld hl, Route8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd1BattleText:
	text "きみ　#　つよそう　だけど"
	line "りかは　とくい　なのかい？"
	done

Route8SuperNerd1EndBattleText:
	text "がーん！　ばったり"
	prompt

Route8SuperNerd1AfterBattleText:
	text "ぼくは　やっぱり"
	line "べんきょうの　ほうが　あってる"
	done

Route8Gambler1Text:
	text_asm
	ld hl, Route8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8Gambler1BattleText:
	text "よっしゃ！"
	line "たたかって　うんだめし　するか"
	done

Route8Gambler1EndBattleText:
	text "<……>　きょうは"
	line "しょうぶ　うん　わるし！"
	prompt

Route8Gambler1AfterBattleText:
	text "どうも　きょうは　ついてねえ"
	line "じっと　してよう"
	done

Route8SuperNerd2Text:
	text_asm
	ld hl, Route8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd2BattleText:
	text "あのね"
	line "たたかい　には　せんりゃくが"
	cont "ひつよう　なんだ"
	done

Route8SuperNerd2EndBattleText:
	text "りかい　できない！"
	prompt

Route8SuperNerd2AfterBattleText:
	text "はじめに　べトべター　だして<……>"
	line "いいや　ほかので　いっきに<……>"
	cont "<……>　うーん　ブツ　ブツ<……>"
	done

Route8CooltrainerF1Text:
	text_asm
	ld hl, Route8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF1BattleText:
	text "あたし　ニドラン　すき　だから"
	line "たくさん　あつめてるの"
	done

Route8CooltrainerF1EndBattleText:
	text "なんで　なんでー"
	prompt

Route8CooltrainerF1AfterBattleText:
	text "#って　そだって　くると"
	line "かわいく　なくなって　きちゃう"
	cont "しんか　しないほうが　かわいいわ！"
	done

Route8SuperNerd3Text:
	text_asm
	ld hl, Route8TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd3BattleText:
	text "べんきょうも　いいけど<……>"
	line "#も　いいね"
	done

Route8SuperNerd3EndBattleText:
	text "<……>　わかった"
	line "ぼくには　べんきょう　しか　ない"
	prompt

Route8SuperNerd3AfterBattleText:
	text "たまには　そとの　くうき　すいに"
	line "いこうと　おもったのに"
	cont "ヤマブキの　ゲートの　せいで"
	cont "みんな　ここで　あしどめだ"
	done

Route8CooltrainerF2Text:
	text_asm
	ld hl, Route8TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF2BattleText:
	text "ニャース　って"
	line "ちょー　かわいーの！"
	cont "にゃー　にゃー　にゃー！"
	done

Route8CooltrainerF2EndBattleText:
	text "そんにゃー！"
	prompt

Route8CooltrainerF2AfterBattleText:
	text "やーん！"
	line "ポッポも　コラッタも　かわいー"
	cont "あたし　まよっちゃう！"
	done

Route8CooltrainerF3Text:
	text_asm
	ld hl, Route8TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF3BattleText:
	text "こうして　ならんでると"
	line "はないち　もんめ　してる　みたい"
	done

Route8CooltrainerF3EndBattleText:
	text "ひどーい！"
	line "みんな　かわいい　#　なのに"
	prompt

Route8CooltrainerF3AfterBattleText:
	text "ヤマブキ　シティの　けいびいん"
	line "ゲート　とおらせて　くれないの"
	cont "まじめ　だけど<……>　いじわるね"
	done

Route8Gambler2Text:
	text_asm
	ld hl, Route8TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8Gambler2BattleText:
	text "おれは　いまどき"
	line "さすらいの　ギャンブラー！"
	done

Route8Gambler2EndBattleText:
	text "<……>！"
	line "ここ　いちばんを　のがす　とは！"
	prompt

Route8Gambler2AfterBattleText:
	text "ギャンブルも　#も"
	line "しょうぶには　かわりない！"
	cont "はじめたら　やめられ　ないのさ"
	done

Route8CooltrainerF4Text:
	text_asm
	ld hl, Route8TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF4BattleText:
	text "まるくって　ふわふわで"
	line "ぬいぐるみ　みたいな　#！"
	cont "<……>　なーんだ？"
	done

Route8CooltrainerF4EndBattleText:
	text "やめてー！"

	para "わたしの　ピッピに"
	line "らんぼう　しないでよう！"
	prompt

Route8CooltrainerF4AfterBattleText:
	text "つきのいしで　ピッピが　なんかに"
	line "しんか　するって"
	cont "#　ジャーナルで　よんだの"
	cont "<……>　ほんと　かしら？"
	done

Route8UndergroundSignText:
	text "ここから　ちかつうろ"
	line "タマムシ　<……>　シオン"
	done
