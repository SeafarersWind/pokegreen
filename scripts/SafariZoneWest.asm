SafariZoneWest_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneWest_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_POTION
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_TM_DOUBLE_TEAM
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_REVIVE
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_GOLD_TEETH
	dw_const SafariZoneWestRestHouseSignText,        TEXT_SAFARIZONEWEST_REST_HOUSE_SIGN
	dw_const SafariZoneWestFindWardensTeethSignText, TEXT_SAFARIZONEWEST_FIND_WARDENS_TEETH_SIGN
	dw_const SafariZoneWestTrainerTipsText,          TEXT_SAFARIZONEWEST_TRAINER_TIPS
	dw_const SafariZoneWestSignText,                 TEXT_SAFARIZONEWEST_SIGN

SafariZoneWestRestHouseSignText:
	text "きゅうけい　ハウス　<……>　いこい"
	done

SafariZoneWestFindWardensTeethSignText:
	text "<……>　おねがいの　けいじばん！"

	para "サファり　ゾーンの　えんちょうが"
	line "この　あたりで"
	cont "いればを　なくし　ました！"

	para "みつけた　かたに　おれい　します"
	line "<……>　サファり　ゾーン　じむ　きょく"
	done

SafariZoneWestTrainerTipsText:
	text "<……>　おとくな　けいじばん！"

	para "ゾーン　たんけん　キャンぺーン！"
	line "トレジャー　ハウスを　さがそう！"
	done

SafariZoneWestSignText:
	text "ここは　だい３　エりア"
	line "ひがし　<……>　ちゅうおう　ひろば"
	done
