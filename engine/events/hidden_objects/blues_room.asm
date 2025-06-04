
	ret ; unused

UnusedPredefText::
	db "@"

PrintBookcaseText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump BookcaseText

BookcaseText::
	text "ほんだなに　ならんでいるのは"
	line "#の　ほん　ばかりだ"
	done
