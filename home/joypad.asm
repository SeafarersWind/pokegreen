Joypad::
; Update the joypad state variables:
; [hJoyReleased]  keys released since last time
; [hJoyPressed]   keys pressed since last time
; [hJoyHeld] currently pressed keys
	homecall _Joypad
	ret
