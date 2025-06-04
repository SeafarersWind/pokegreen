SECTION "NULL", ROM0
NULL::

INCLUDE "home/header.asm"


SECTION "High Home", ROM0

; padding
	db $00, $00, $00, $00, $00, $00, $00, $ff, $df, $3d, $5d, $f3, $37, $fd, $71, $f5
	db $bf, $57, $fd, $97, $76, $bb, $d9, $df, $df, $ff, $d9, $ff, $ff, $d9, $9f, $ff
	db $ff, $ff, $df, $ff, $fd, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $fd, $ff
	db $ff, $df, $ff, $ff, $7f, $ff, $ff, $ff, $ff, $ff, $fb, $ff, $ff, $ff, $f3, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $df, $ff, $ff, $bf, $fb, $df, $ff, $f7, $b7, $ff
	db $ff, $ff, $ff, $ff, $ff, $ff, $77, $7f, $ff, $fb, $ff, $ff, $f7, $ff, $f7, $ff
	db $fd, $7f, $ff, $fd, $df, $ff, $df, $ff, $ff, $ff, $ff, $ff, $ff, $f7, $ff, $7f
	db $ff, $ff, $ff, $ff, $fd, $ff, $ff, $ff, $fb, $7b, $ff, $ff, $f7, $ff, $fb, $fd
	db $ff, $ff, $ff, $ff, $f7, $ff, $fd, $ff, $ff, $f7, $ff, $ff, $ff, $ff, $ff, $fd
	db $fd, $ff, $ff, $ff, $ff, $ff, $ff, $f7, $ff, $ff, $ff, $fb, $ff, $ff, $ff

SECTION "Home", ROM0

INCLUDE "home/start.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/clear_sprites.asm"
INCLUDE "home/copy.asm"

INCLUDE "data/tilesets/collision_tile_ids.asm"

INCLUDE "home/copy2.asm"
INCLUDE "home/text.asm"
INCLUDE "home/vcopy.asm"
INCLUDE "home/init.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/timer.asm"
INCLUDE "home/audio.asm"
INCLUDE "home/update_sprites.asm"

INCLUDE "data/items/marts.asm"

INCLUDE "home/overworld_text.asm"
INCLUDE "home/uncompress.asm"
INCLUDE "home/reset_player_sprite.asm"
INCLUDE "home/fade_audio.asm"
INCLUDE "home/text_script.asm"
INCLUDE "home/start_menu.asm"
INCLUDE "home/count_set_bits.asm"
INCLUDE "home/inventory.asm"
INCLUDE "home/list_menu.asm"
INCLUDE "home/names.asm"
INCLUDE "home/reload_tiles.asm"

INCLUDE "data/maps/map_header_pointers.asm"

INCLUDE "home/overworld.asm"
INCLUDE "home/pokemon.asm"
INCLUDE "home/print_bcd.asm"
INCLUDE "home/pics.asm"
INCLUDE "home/item.asm"
INCLUDE "home/textbox.asm"
INCLUDE "home/npc_movement.asm"
INCLUDE "home/trainers.asm"
INCLUDE "home/map_objects.asm"
INCLUDE "home/trainers2.asm"
INCLUDE "home/money.asm"
INCLUDE "home/bankswitch.asm"
INCLUDE "home/yes_no.asm"
INCLUDE "home/pathfinding.asm"
INCLUDE "home/load_font.asm"
INCLUDE "home/tilemap.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/names2.asm"
INCLUDE "home/item_price.asm"
INCLUDE "home/copy_string.asm"
INCLUDE "home/joypad2.asm"
INCLUDE "home/math.asm"
INCLUDE "home/print_text.asm"
INCLUDE "home/move_mon.asm"
INCLUDE "home/array.asm"
INCLUDE "home/compare.asm"
INCLUDE "home/oam.asm"
INCLUDE "home/window.asm"
INCLUDE "home/print_num.asm"
INCLUDE "home/array2.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/reload_sprites.asm"
INCLUDE "home/give.asm"
INCLUDE "home/random.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/hidden_objects.asm"
INCLUDE "home/predef_text.asm"

; padding
	db $a0, $79, $f9, $7e, $b0, $7e, $09, $7f, $4e, $7f, $8e, $7f, $90, $7f, $50, $7f
	db $82, $7f, $c9, $7f, $a5, $b7, $67, $e3, $77, $bb, $fd, $c9, $fb, $85, $e7, $53
	db $c9, $81, $a3, $c7, $3f, $85, $33, $4d, $15, $00
