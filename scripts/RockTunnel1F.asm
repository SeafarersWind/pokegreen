RockTunnel1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel1TrainerHeaders
	ld de, RockTunnel1F_ScriptPointers
	ld a, [wRockTunnel1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnel1FCurScript], a
	ret

RockTunnel1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKTUNNEL1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKTUNNEL1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKTUNNEL1F_END_BATTLE

RockTunnel1F_TextPointers:
	def_text_pointers
	dw_const RockTunnel1FHiker1Text,        TEXT_ROCKTUNNEL1F_HIKER1
	dw_const RockTunnel1FHiker2Text,        TEXT_ROCKTUNNEL1F_HIKER2
	dw_const RockTunnel1FHiker3Text,        TEXT_ROCKTUNNEL1F_HIKER3
	dw_const RockTunnel1FSuperNerdText,     TEXT_ROCKTUNNEL1F_SUPER_NERD
	dw_const RockTunnel1FCooltrainerF1Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F1
	dw_const RockTunnel1FCooltrainerF2Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F2
	dw_const RockTunnel1FCooltrainerF3Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F3
	dw_const RockTunnel1FSignText,          TEXT_ROCKTUNNEL1F_SIGN

RockTunnel1TrainerHeaders:
	def_trainers
RockTunnel1TrainerHeader0:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_0, 4, RockTunnel1FHiker1BattleText, RockTunnel1FHiker1EndBattleText, RockTunnel1FHiker1AfterBattleText
RockTunnel1TrainerHeader1:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1, 4, RockTunnel1FHiker2BattleText, RockTunnel1FHiker2EndBattleText, RockTunnel1FHiker2AfterBattleText
RockTunnel1TrainerHeader2:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2, 3, RockTunnel1FHiker3BattleText, RockTunnel1FHiker3EndBattleText, RockTunnel1FHiker3AfterBattleText
RockTunnel1TrainerHeader3:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3, 3, RockTunnel1FSuperNerdBattleText, RockTunnel1FSuperNerdEndBattleText, RockTunnel1FSuperNerdAfterBattleText
RockTunnel1TrainerHeader4:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4, 4, RockTunnel1FCooltrainerF1BattleText, RockTunnel1FCooltrainerF1EndBattleText, RockTunnel1FCooltrainerF1AfterBattleText
RockTunnel1TrainerHeader5:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5, 4, RockTunnel1FCooltrainerF2BattleText, RockTunnel1FCooltrainerF2EndBattleText, RockTunnel1FCooltrainerF2AfterBattleText
RockTunnel1TrainerHeader6:
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6, 4, RockTunnel1FCooltrainerF3BattleText, RockTunnel1FCooltrainerF3EndBattleText, RockTunnel1FCooltrainerF3AfterBattleText
	db -1 ; end

RockTunnel1FHiker1Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader0
	jr RockTunnel1FTalkToTrainer

RockTunnel1FHiker2Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader1
	jr RockTunnel1FTalkToTrainer

RockTunnel1FHiker3Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader2
	jr RockTunnel1FTalkToTrainer

RockTunnel1FSuperNerdText:
	text_asm
	ld hl, RockTunnel1TrainerHeader3
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF1Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader4
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF2Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader5
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF3Text:
	text_asm
	ld hl, RockTunnel1TrainerHeader6
RockTunnel1FTalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel1FHiker1BattleText:
	text "この　ながーい"
	line "トンネルを　ぬける　つもりか！"
	done

RockTunnel1FHiker1EndBattleText:
	text "おいらの　まけだ"
	prompt

RockTunnel1FHiker1AfterBattleText:
	text "たまに　でる　イワークは"
	line "レべルが　たかいと　しめつけてくる"
	cont "きを　つけなよ"
	done

RockTunnel1FHiker2BattleText:
	text "えーと"
	line "みちに　まよったかな？"
	done

RockTunnel1FHiker2EndBattleText:
	text "たたかってる"
	line "ばあいじゃ　なかった"
	cont "でぐちは　どっち　だっけ？"
	prompt

RockTunnel1FHiker2AfterBattleText:
	text "１２ばん　どうろに"
	line "#が　ねてたろ？"
	cont "おれも　こまって　まわりみちだ"
	done

RockTunnel1FHiker3BattleText:
	text "おれは"
	line "やまに　すんで　ながい"
	cont "よそものに　でかい　つらは　させん"
	done

RockTunnel1FHiker3EndBattleText:
	text "やるなあ"
	prompt

RockTunnel1FHiker3AfterBattleText:
	text "おまえ　みこみが　ある"
	line "やまおとこに　ならんか？"
	done

RockTunnel1FSuperNerdBattleText:
	text "#　ファイトー！"
	line "レディー　ゴー！"
	done

RockTunnel1FSuperNerdEndBattleText:
	text "やぶれたのか"
	prompt

RockTunnel1FSuperNerdAfterBattleText:
	text "ズバットでも"
	line "とって　かえろうかな<……>"
	done

RockTunnel1FCooltrainerF1BattleText:
	text "きゃ　びっくり！"
	line "うすぐらい　からって"
	cont "へんな　こと　しないで！"
	done

RockTunnel1FCooltrainerF1EndBattleText:
	text "<……>　くらくて"
	line "よく　みえないんだもん"
	prompt

RockTunnel1FCooltrainerF1AfterBattleText:
	text "トンネルにも　#　いるのね"
	line "さっき　ワンりキーが　いたわ"
	done

RockTunnel1FCooltrainerF2BattleText:
	text "#　さがしに　きて"
	line "こんな　とこまで　きちゃった！"
	done

RockTunnel1FCooltrainerF2EndBattleText:
	text "もう　#　ないわ"
	prompt

RockTunnel1FCooltrainerF2AfterBattleText:
	text "かわいい　かお　して"
	line "けっこう　つよい　じゃない"
	done

RockTunnel1FCooltrainerF3BattleText:
	text "あ　それは　#！"
	line "さっそく　はじめましょ！"
	done

RockTunnel1FCooltrainerF3EndBattleText:
	text "でなおして　くるわ"
	prompt

RockTunnel1FCooltrainerF3AfterBattleText:
	text "エキサイト　して"
	line "あせ　かいちゃったわ"
	done

RockTunnel1FSignText:
	text "ここは　イワヤマ　トンネル"
	line "ハナダ　シティ　<……>　シオン　タウン"
	done
