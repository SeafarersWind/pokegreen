Route7_Script:
	jp EnableAutoTextBoxDrawing

Route7_TextPointers:
	def_text_pointers
	dw_const Route7UndergroundPathSignText, TEXT_ROUTE7_UNDERGROUND_PATH_SIGN

Route7UndergroundPathSignText:
	text "ここから　ちかつうろ"
	line "タマムシ　<……>　シオン"
	done
