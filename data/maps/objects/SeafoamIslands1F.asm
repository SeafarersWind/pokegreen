	object_const_def
	const_export SEAFOAMISLANDS1F_BOULDER1
	const_export SEAFOAMISLANDS1F_BOULDER2

SeafoamIslands1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  4, 17, LAST_MAP, 1
	warp_event  5, 17, LAST_MAP, 1
	warp_event 26, 17, LAST_MAP, 2
	warp_event 27, 17, LAST_MAP, 2
	warp_event  7,  5, SEAFOAM_ISLANDS_B1F, 2
	warp_event 25,  3, SEAFOAM_ISLANDS_B1F, 7
	warp_event 23, 15, SEAFOAM_ISLANDS_B1F, 5

	def_bg_events
	bg_event  5, 13, 3 ; glitched text boxes
	bg_event 25, 13, 4

	def_object_events
	object_event 18, 10, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDS1F_BOULDER1
	object_event 26,  7, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, TEXT_SEAFOAMISLANDS1F_BOULDER2

	def_warps_to SEAFOAM_ISLANDS_1F

	; holes
	warp_to 17, 6, SEAFOAM_ISLANDS_1F_WIDTH
	warp_to 24, 6, SEAFOAM_ISLANDS_1F_WIDTH
