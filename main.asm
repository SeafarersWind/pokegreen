SECTION "bank1", ROMX

INCLUDE "data/sprites/facings.asm"
INCLUDE "data/pokemon/mew.asm"
INCLUDE "data/items/prices.asm"
INCLUDE "data/items/names.asm"
INCLUDE "data/text/unused_names.asm"
INCLUDE "engine/gfx/sprite_oam.asm"
INCLUDE "engine/gfx/oam_dma.asm"
INCLUDE "engine/movie/title.asm"
INCLUDE "engine/link/print_waiting_text.asm"
INCLUDE "engine/overworld/sprite_collisions.asm"
INCLUDE "engine/debug/debug_menu.asm"
INCLUDE "engine/events/pick_up_item.asm"
INCLUDE "engine/overworld/movement.asm"
INCLUDE "engine/link/cable_club.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/movie/oak_speech/oak_speech.asm"
INCLUDE "engine/overworld/special_warps.asm"
INCLUDE "engine/debug/debug_party.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/movie/oak_speech/oak_speech2.asm"
INCLUDE "engine/items/subtract_paid_money.asm"
INCLUDE "engine/menus/swap_items.asm"
INCLUDE "engine/events/pokemart.asm"
INCLUDE "engine/pokemon/learn_move.asm"
INCLUDE "engine/events/pokecenter.asm"
INCLUDE "engine/events/set_blackout_map.asm"
INCLUDE "engine/menus/display_text_id_init.asm"
INCLUDE "engine/menus/draw_start_menu.asm"
INCLUDE "engine/link/cable_club_npc.asm"
INCLUDE "engine/events/black_out.asm"
INCLUDE "engine/pokemon/load_mon_data.asm"
INCLUDE "engine/battle/safari_zone.asm"
INCLUDE "engine/menus/text_box.asm"
INCLUDE "engine/battle/move_effects/drain_hp.asm"
INCLUDE "engine/menus/players_pc.asm"
INCLUDE "engine/pokemon/remove_mon.asm"
INCLUDE "engine/events/display_pokedex.asm"

; pading
IF DEF(_RED)
	db $d6
ENDC
	db $cb, $b6, $cd, $86, $1b


SECTION "bank3", ROMX

INCLUDE "engine/joypad.asm"
INCLUDE "data/maps/hide_show_data.asm"
INCLUDE "engine/overworld/field_move_messages.asm"
INCLUDE "engine/items/inventory.asm"
INCLUDE "data/maps/songs.asm"
INCLUDE "data/maps/map_header_banks.asm"
INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/events/poison.asm"
INCLUDE "engine/overworld/tilesets.asm"
INCLUDE "engine/overworld/daycare_exp.asm"
INCLUDE "engine/overworld/wild_mons.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/menus/draw_badges.asm"
INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/missable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"
INCLUDE "engine/pokemon/add_mon.asm"
INCLUDE "engine/flag_action.asm"
INCLUDE "engine/events/heal_party.asm"
INCLUDE "engine/math/bcd.asm"
INCLUDE "engine/movie/oak_speech/init_player_data.asm"
INCLUDE "engine/items/get_bag_item_quantity.asm"
INCLUDE "engine/overworld/pathfinding.asm"
INCLUDE "engine/gfx/hp_bar.asm"
INCLUDE "engine/events/hidden_objects/bookshelves.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_statues.asm"
INCLUDE "engine/events/hidden_objects/book_or_sculpture.asm"
INCLUDE "engine/events/hidden_objects/elevator.asm"
INCLUDE "engine/events/hidden_objects/town_map.asm"
INCLUDE "engine/events/hidden_objects/pokemon_stuff.asm"

; padding
	db $01, $29, $09, $03, $10, $02, $60, $21, $21, $31, $29, $21, $13, $00, $09, $01
	db $83, $43, $49, $88, $20, $50, $41, $01, $43, $11, $c1, $41, $13, $03, $d3


SECTION "Font Graphics", ROMX

INCLUDE "gfx/font.asm"


SECTION "Battle Engine 1a", ROMX

INCLUDE "gfx/player.asm"
INCLUDE "engine/overworld/turn_sprite.asm"
INCLUDE "engine/menus/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"


SECTION "Battle Engine 1b", ROMX

INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/pokemon/status_screen.asm"
INCLUDE "engine/menus/party_menu.asm"
INCLUDE "engine/battle/end_of_battle.asm"
INCLUDE "engine/battle/wild_encounters.asm"
INCLUDE "engine/battle/move_effects/recoil.asm"
INCLUDE "engine/battle/move_effects/conversion.asm"
INCLUDE "engine/battle/move_effects/haze.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/math/random.asm"

; padding
	db $00, $0d, $35, $41, $00


SECTION "Battle Engine 2", ROMX

INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/gfx/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/battle/move_effects/substitute.asm"
INCLUDE "engine/menus/pc.asm"

; padding
	db $03, $01, $01, $04, $01, $24, $29, $10, $02, $51, $21, $21, $a9, $01, $01, $21
	db $82, $41, $01, $09, $40, $e1, $0d, $01, $09, $0a, $06, $83, $01, $82, $00, $00
	db $11, $01, $00, $03, $00, $21, $15, $03, $20, $23


SECTION "Play Time", ROMX

INCLUDE "engine/play_time.asm"


SECTION "Doors and Ledges", ROMX

INCLUDE "engine/overworld/auto_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"

; padding
	db $ff, $10, $ff, $20, $ff, $40, $ff, $60, $ff, $10, $ff, $20, $ff, $40, $ff, $60
	db $f3, $89, $eb, $a7, $39, $33, $6f, $2f, $ff, $a3, $4b, $3f, $ef, $ef, $27, $6D
	db $bb, $e3, $7f, $c7, $7f, $2f, $9B, $bd, $ed, $2f, $b7, $d3, $af, $bb, $bf, $00


SECTION "Pokémon Names", ROMX

INCLUDE "engine/movie/oak_speech/clear_save.asm"
INCLUDE "engine/events/elevator.asm"


SECTION "Hidden Objects 1", ROMX

INCLUDE "engine/menus/oaks_pc.asm"
INCLUDE "engine/events/hidden_objects/new_bike.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_posters.asm"
INCLUDE "engine/events/hidden_objects/safari_game.asm"
INCLUDE "engine/events/hidden_objects/cinnabar_gym_quiz.asm"
INCLUDE "engine/events/hidden_objects/magazines.asm"
INCLUDE "engine/events/hidden_objects/bills_house_pc.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_email.asm"

; padding
	db $56, $7f, $56, $57, $a9, $a6, $0f, $05, $e7, $a3, $ef, $0d, $ed, $20, $9b, $4d
	db $85, $69, $af, $01, $65, $01, $e5, $89, $41, $c5, $47, $c1, $2d, $07, $7f, $0d
	db $23, $51, $35, $43, $e3, $01, $41, $f7, $27, $a1, $0d, $0e, $e3, $a1, $9f, $49
	db $61, $41, $2f, $f3, $f1, $99, $c6, $6f, $01, $4b, $c1, $97, $3f, $09, $6d, $af
	db $01, $29, $ef, $c1, $87, $83, $5b


SECTION "Bill's PC", ROMX

INCLUDE "engine/pokemon/bills_pc.asm"


SECTION "Battle Engine 3", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"
INCLUDE "engine/battle/move_effects/focus_energy.asm"

; padding
	db $81, $21, $4c, $81, $0f, $c5, $f3, $81, $01, $80, $81, $4d, $05, $21, $85, $61
	db $05, $83, $13, $44, $89, $a8, $0b, $03, $4d, $91, $a0, $81, $88, $41, $05, $a1
	db $01, $05, $a7, $21, $a1, $89, $b0, $23, $01, $21, $03, $75, $04, $89, $85, $a5
	db $0b, $00


SECTION "Battle Engine 4", ROMX

INCLUDE "engine/battle/move_effects/leech_seed.asm"

; padding
	db $c1, $1d, $8d, $77, $7b, $fd, $73


SECTION "Battle Engine 5", ROMX

INCLUDE "gfx/trainer_card.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/display_effectiveness.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/battle/move_effects/pay_day.asm"
INCLUDE "engine/slots/game_corner_slots2.asm"

; padding
	db $79


SECTION "Battle Engine 6", ROMX

INCLUDE "engine/battle/move_effects/mist.asm"
INCLUDE "engine/battle/move_effects/one_hit_ko.asm"

; paddin
	db $fd, $8f, $4B, $dd, $fd, $bf, $bf, $e7, $fb, $7d, $fd, $ef, $ef, $bb, $fb, $f5
	db $df, $97, $ef, $9B, $f7, $df, $dB, $ea, $f5, $9f, $b3, $ff


SECTION "Slot Machines", ROMX

INCLUDE "engine/slots/slot_machine.asm"
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/events/pewter_guys.asm"
INCLUDE "engine/math/multiply_divide.asm"
INCLUDE "engine/slots/game_corner_slots.asm"


SECTION "Battle Engine 7", ROMX

INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/names.asm"
INCLUDE "data/pokemon/cries.asm"
INCLUDE "data/moves/moves.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"
INCLUDE "gfx/trade.asm"
INCLUDE "engine/pokemon/evos_moves.asm"
INCLUDE "engine/battle/move_effects/heal.asm"
INCLUDE "engine/battle/move_effects/transform.asm"
INCLUDE "engine/battle/move_effects/reflect_light_screen.asm"

; padding
	db $fd


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/effects.asm"

; padding
	db $db, $e9, $e5, $35, $7f


SECTION "bank10", ROMX

INCLUDE "engine/menus/pokedex.asm"
INCLUDE "engine/movie/trade.asm"
INCLUDE "engine/movie/intro.asm"
INCLUDE "engine/movie/trade2.asm"

; padding
	db $21, $91, $ad, $01, $45, $25, $31, $65, $a5, $00, $17, $09, $04, $cb


SECTION "Pokédex Rating", ROMX

INCLUDE "engine/events/pokedex_rating.asm"


SECTION "Hidden Objects Core", ROMX

INCLUDE "engine/overworld/hidden_objects.asm"

; padding
	db $01, $01, $35, $03, $08, $09, $18, $a1, $49, $82, $00, $05, $01, $41, $36, $30
	db $05, $03, $22, $c1, $83, $09, $23, $11, $09, $01, $09, $0c, $01, $43, $21, $01
	db $81, $13, $01, $81, $c1, $21, $10, $8d, $93, $41, $60, $05, $0c, $29, $40, $71


SECTION "Screen Effects", ROMX

INCLUDE "engine/gfx/screen_effects.asm"


SECTION "Predefs", ROMX

INCLUDE "engine/events/give_pokemon.asm"
INCLUDE "engine/predefs.asm"

; padding
	db $95, $E3


SECTION "Battle Engine 8", ROMX

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/move_effects/paralyze.asm"


SECTION "Hidden Objects 2", ROMX

INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/prize_menu.asm"
INCLUDE "engine/events/hidden_objects/school_notebooks.asm"
INCLUDE "engine/events/hidden_objects/fighting_dojo.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_hq.asm"

; padding
	db $00, $00, $04, $02, $24, $00, $00, $90, $00, $10, $00, $c0, $21, $00, $82, $a0
	db $01, $02, $00


SECTION "Battle Engine 9", ROMX

INCLUDE "engine/battle/experience.asm"


SECTION "Diploma", ROMX

INCLUDE "engine/events/diploma.asm"


SECTION "Trainer Sight", ROMX

INCLUDE "engine/overworld/trainer_sight.asm"

; padding
	db $61, $51, $80, $10, $81, $20, $40, $00, $00, $40, $00


SECTION "Battle Engine 10", ROMX

INCLUDE "engine/events/oaks_aide.asm"
INCLUDE "engine/pokemon/experience.asm"


SECTION "Saffron Guards", ROMX

INCLUDE "engine/battle/common_text.asm"
INCLUDE "engine/events/saffron_guards.asm"

; padding
	db $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $08
	db $00, $01, $00, $00, $00, $00, $00, $00


SECTION "Starter Dex", ROMX

INCLUDE "engine/events/starter_dex.asm"


SECTION "Hidden Objects 3", ROMX

INCLUDE "engine/pokemon/set_types.asm"
INCLUDE "engine/events/hidden_objects/reds_room.asm"
INCLUDE "engine/events/hidden_objects/route_15_binoculars.asm"
INCLUDE "engine/events/hidden_objects/museum_fossils.asm"
INCLUDE "engine/events/hidden_objects/school_blackboard.asm"
INCLUDE "engine/events/hidden_objects/vermilion_gym_trash.asm"

; padding
	db $00, $01, $00, $00, $01, $8c, $00, $00, $80, $10, $00, $00, $11, $11, $00, $00
	db $01, $04, $00, $80, $05, $00, $00, $20, $00, $00, $06, $06, $0b, $21, $08, $c1
	db $00, $00, $00, $00, $00, $00, $00, $d0, $02, $00, $00, $00, $01, $00, $00, $92
	db $00, $00


SECTION "Cinnabar Lab Fossils", ROMX

INCLUDE "engine/events/cinnabar_lab.asm"


SECTION "Hidden Objects 4", ROMX

INCLUDE "engine/events/hidden_objects/gym_statues.asm"
INCLUDE "engine/events/hidden_objects/bench_guys.asm"
INCLUDE "engine/events/hidden_objects/blues_room.asm"
INCLUDE "engine/events/hidden_objects/pokecenter_pc.asm"

; padding
	db $c3, $39, $3f, $f9, $0d, $c5, $01, $52, $01, $45, $88, $01, $01, $04, $80, $29
	db $e0, $05, $28, $47, $80, $09, $07, $89, $01, $03, $28, $29, $81, $a9, $01, $a1
	db $81, $81, $20, $e0, $00, $03, $01, $ab, $06, $60, $00, $29, $41, $c5, $08, $ae


SECTION "Battle Engine 11a", ROMX

INCLUDE "gfx/version.asm"


SECTION "Battle Engine 11b", ROMX

INCLUDE "engine/battle/decrement_pp.asm"

; padding
	db $00


SECTION "bank1C", ROMX

INCLUDE "engine/movie/credits.asm"
INCLUDE "engine/movie/splash.asm"
INCLUDE "engine/movie/hall_of_fame.asm"
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/ghost_marowak_anim.asm"
INCLUDE "engine/battle/battle_transitions.asm"
INCLUDE "engine/items/town_map.asm"
INCLUDE "engine/gfx/mon_icons.asm"
INCLUDE "engine/events/in_game_trades.asm"
INCLUDE "engine/gfx/palettes.asm"
INCLUDE "engine/menus/save.asm"

; padding
	db $00, $01, $00, $00, $00, $00, $00, $80


SECTION "Itemfinder 1", ROMX

INCLUDE "engine/items/itemfinder.asm"


SECTION "Vending Machine", ROMX

INCLUDE "engine/events/vending_machine.asm"


SECTION "Itemfinder 2", ROMX

INCLUDE "engine/menus/league_pc.asm"
INCLUDE "engine/events/hidden_items.asm"

; padding
	db $aa, $0e, $80, $05, $84, $02, $21, $64, $bC, $80, $08, $d4, $20, $00, $84, $04
	db $90, $04, $c4, $40, $29, $04, $26, $a5, $83, $04, $00, $0c, $0a, $13, $09, $6a
	db $09, $20, $01, $68, $60, $00, $01, $c0, $c1, $c1, $8d, $80, $32, $00, $28, $01
	db $19, $0b, $a0, $03, $c3, $00, $00, $01, $40, $a3, $01, $21, $40, $24


SECTION "bank1E", ROMX

INCLUDE "engine/pokemon/status_ailments.asm"
INCLUDE "engine/battle/animations.asm"
INCLUDE "engine/overworld/cut2.asm"
INCLUDE "engine/overworld/dust_smoke.asm"
INCLUDE "gfx/fishing.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "data/battle_anims/subanimations.asm"
INCLUDE "data/battle_anims/frame_blocks.asm"
INCLUDE "engine/movie/evolution.asm"
INCLUDE "engine/overworld/elevator.asm"
INCLUDE "engine/items/tm_prices.asm"

; padding
	db $01, $01, $28, $20, $42, $05, $00, $20, $04, $00, $0c, $41, $c1, $06, $a4, $85
	db $20, $01, $02, $00
