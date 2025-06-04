CopycatsHouse2F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse2F_TextPointers:
	def_text_pointers
	dw_const CopycatsHouse2FCopycatText,      TEXT_COPYCATSHOUSE2F_COPYCAT
	dw_const CopycatsHouse2FDoduoText,        TEXT_COPYCATSHOUSE2F_DODUO
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_MONSTER
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_BIRD
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_FAIRY
	dw_const CopycatsHouse2FSNESText,         TEXT_COPYCATSHOUSE2F_SNES
	dw_const CopycatsHouse2FPCText,           TEXT_COPYCATSHOUSE2F_PC

CopycatsHouse2FCopycatText:
	text_asm
	CheckEvent EVENT_GOT_TM31
	jr nz, .got_item
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .DoYouLikePokemonText
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .done
	ld hl, .TM31PreReceiveText
	call PrintText
	lb bc, TM_MIMIC, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM31Text
	call PrintText
	ld a, POKE_DOLL
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_TM31
	jr .done
.bag_full
	ld hl, .TM31NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM31Explanation2Text
	call PrintText
.done
	jp TextScriptEnd

.DoYouLikePokemonText:
	text "<PLAYER><BOLD_P>やあ！　こんにちは！"
	line "きみ　#　すきかい？"

	para "<PLAYER><BOLD_P>ぼく　じゃなくって"
	line "きみに　きいてるんだ　けど"

	para "<PLAYER><BOLD_P><……>　えー　なんだよ！"
	line "へンな　やつ　だなあ！"

	para "モノマネむすめ<BOLD_P><……>　なに？"
	line "ひとの　マネ　すんなって？"

	para "だって　あたし　"
	line "ものまね　しゅみ　なんだ　もん！"
	prompt

.TM31PreReceiveText:
	text "わあー！"
	line "ピッピにんぎょう　くれるのー！"

	para "うれしーい！"

	para "<……>　じゃあねー！"
	line "わたし　からは　これ　あげるー！"
	prompt

.ReceivedTM31Text:
	text "<PLAYER>は　むすめさんから"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_item_1
	text_start

	para "<TM>３１の　なかは"
	line "わたしの　だいすきな　ものまね！"

	para "あなたの　すきな　#に"
	line "つかって　あげて！@"
	text_waitbutton
	text_end

.TM31Explanation2Text:
	text "<PLAYER><BOLD_P>やあ！　さっきは"
	line "<TM>　ありがとう！"

	para "<PLAYER><BOLD_P><……>　なーに？"

	para "<PLAYER><BOLD_P>ぼくの　まね　して"
	line "そんなに　たのしい　かい？"

	para "モノマネむすめ<BOLD_P>うん<……>！"
	line "とっても　たのしいー！"
	done

.TM31NoRoomText:
	text "にもつが　いっぱいね！@"
	text_waitbutton
	text_end

CopycatsHouse2FDoduoText:
	text "ドードー<BOLD_P>ギー　ギーッ！"

	para "<……>　カガミ　ヨ　カガミ！"
	line "セカイデ　イチバン　カワイイ"
	cont "オンナノコハ　ダーレ？"
	done

CopycatsHouse2FRareDollText:
	text "これは　めずらしい　#！？"
	line "<……>　あれ？　ぬいぐるみ　だった"
	done

CopycatsHouse2FSNESText:
	text "これは<……>！"
	line "マりオが　バケツを　かぶって"
	cont "あるいて　いく　ゲームだ！"
	done

CopycatsHouse2FPCText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .CantSeeText
	jr nz, .notUp
	ld hl, .MySecretsText
.notUp
	call PrintText
	jp TextScriptEnd

.MySecretsText:
	text "<……>　<……>　<……>"

	para "わたしの　ひみつ<……>！"

	para "とくいなもの　<……>　ものまね！"
	line "しゅみ　<……>　ぬいぐるみ！"
	cont "すきなもの　<……>　ピッピ！"
	cont "<……>　<……>　<……>"
	done

.CantSeeText:
	text "？　みえないぞ<……>"
	done
