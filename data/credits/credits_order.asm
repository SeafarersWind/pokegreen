CreditsOrderPointers:
	dw CreditsMon
	dw CreditsDirector
	dw CreditsProgrammers1
	dw CreditsProgrammers2
	dw CreditsCharDesign
	dw CreditsMusic
	dw CreditsSoundEffects
	dw CreditsGameDesign
	dw CreditsMonsterDesign1
	dw CreditsMonsterDesign2
	dw CreditsGameScene1
	dw CreditsGameScene2
	dw CreditsParam
	dw CreditsMap1
	dw CreditsMap2
	dw CreditsTest1
	dw CreditsTest2
	dw CreditsSpecial1
	dw CreditsSpecial2
	dw CreditsSpecial3
	dw CreditsProducers1
	dw CreditsProducers2
	dw CreditsProducers3
	dw CreditsProducer
	dw CreditsCopyright
	dw CreditsTheEnd

CreditsOrder:
; subsequent credits elements will be displayed on separate lines.
; CRED_TEXT, CRED_TEXT_FADE, CRED_TEXT_MON, and CRED_TEXT_FADE_MON are
; commands that are used to go to the next set of credits texts.
CreditsMon:
	db CRED_MON, CRED_VERSION, CRED_TEXT_FADE_MON
CreditsDirector:
	db CRED_DIRECTOR, CRED_TAJIRI, CRED_TEXT_FADE_MON
CreditsProgrammers1:
	db CRED_PROGRAMMERS, CRED_TA_OOTA, CRED_TEXT_FADE
CreditsProgrammers2:
	db CRED_PROGRAMMERS, CRED_MORIMOTO, CRED_WATANABE, CRED_MASUDE, CRED_TEXT_MON
CreditsCharDesign:
	db CRED_CHAR_DESIGN, CRED_SUGIMORI, CRED_NISHIDA, CRED_TEXT_FADE_MON
CreditsMusic:
	db CRED_MUSIC, CRED_MASUDE, CRED_TEXT_FADE
CreditsSoundEffects:
	db CRED_SOUND_EFFECTS, CRED_MASUDE, CRED_TEXT_MON
CreditsGameDesign:
	db CRED_GAME_DESIGN, CRED_TAJIRI, CRED_TEXT_FADE_MON
CreditsMonsterDesign1:
	db CRED_MONSTER_DESIGN, CRED_SUGIMORI, CRED_NISHIDA, CRED_TEXT_FADE
CreditsMonsterDesign2:
	db CRED_MONSTER_DESIGN, CRED_FUZIWARA, CRED_MORIMOTO, CRED_TEXT_MON
CreditsGameScene1:
	db CRED_GAME_SCENE, CRED_TAJIRI, CRED_TEXT_FADE
CreditsGameScene2:
	db CRED_GAME_SCENE, CRED_TANIGUCHI, CRED_NONOMURA, CRED_ZINNAI, CRED_TEXT_MON
CreditsParam:
	db CRED_PARAM, CRED_NISINO, CRED_TEXT_FADE_MON
CreditsMap1:
	db CRED_MAP, CRED_TAJIRI, CRED_NISINO, CRED_TEXT_FADE
CreditsMap2:
	db CRED_MAP, CRED_MATSUSIMA, CRED_NONOMURA, CRED_TANIGUCHI, CRED_TEXT_MON
CreditsTest1:
	db CRED_TEST, CRED_KAKEI, CRED_TSUCHIYA, CRED_TEXT_FADE
CreditsTest2:
	db CRED_TEST, CRED_TA_NAKAMURA, CRED_YUDA, CRED_TEXT_MON
CreditsSpecial1:
	db CRED_SPECIAL, CRED_HISHIDA, CRED_SAKAI, CRED_TEXT_FADE
CreditsSpecial2:
	db CRED_SPECIAL, CRED_YAMAGUCHI, CRED_YAMAMOTO, CRED_TEXT
CreditsSpecial3:
	db CRED_SPECIAL, CRED_TOMISAWA, CRED_KAWAMOTO, CRED_TEXT_MON
CreditsProducers1:
	db CRED_PRODUCERS, CRED_MIYAMOTO, CRED_TEXT_FADE
CreditsProducers2:
	db CRED_PRODUCERS, CRED_KAWAGUCHI, CRED_TEXT
CreditsProducers3:
	db CRED_PRODUCERS, CRED_ISHIHARA, CRED_TEXT_MON
CreditsProducer:
	db CRED_PRODUCER, CRED_YAMAUCHI, CRED_TEXT_FADE_MON
CreditsCopyright:
	db CRED_COPYRIGHT, CRED_TEXT_FADE_MON
CreditsTheEnd:
	db CRED_THE_END
