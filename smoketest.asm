;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module smoketest
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hUGE_init
	.globl _hUGE_dosound
	.globl b_banked_func
	.globl _banked_func
	.globl _set_tile_map_compat
	.globl _set_tile_map
	.globl _set_tile_2bpp_data
	.globl _joypad_ex
	.globl _joypad_init
	.globl _vsync
	.globl _tick
	.globl _anim
	.globl _yspd
	.globl _xspd
	.globl _y
	.globl _x
	.globl _joy
	.globl _tilemapw
	.globl _tilemap
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_MEMORY_CTL	=	0x003e
_JOY_CTL	=	0x003f
_VCOUNTER	=	0x007e
_PSG	=	0x007f
_HCOUNTER	=	0x007f
_VDP_DATA	=	0x00be
_VDP_CMD	=	0x00bf
_VDP_STATUS	=	0x00bf
_JOY_PORT1	=	0x00dc
_JOY_PORT2	=	0x00dd
_FMADDRESS	=	0x00f0
_FMDATA	=	0x00f1
_AUDIOCTRL	=	0x00f2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_RAM_CONTROL	=	0xfffc
_GLASSES_3D	=	0xfff8
_MAP_FRAME0	=	0xfffd
_MAP_FRAME1	=	0xfffe
_MAP_FRAME2	=	0xffff
_joy::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_x::
	.ds 2
_y::
	.ds 2
_xspd::
	.ds 1
_yspd::
	.ds 1
_anim::
	.ds 1
_tick::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;smoketest.c:26: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;smoketest.c:27: hUGE_init(&sample_song);
	ld	hl, #_sample_song
	call	_hUGE_init
;smoketest.c:29: HIDE_LEFT_COLUMN;
	ld	a, (_shadow_VDP_R0+0)
	or	a, #0x20
	ld	(_shadow_VDP_R0+0), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_R0+0)
	out	(_VDP_CMD), a
	ld	a, #0x80
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00382$
	ei
00382$:
;smoketest.c:30: SPRITES_8x16;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x02
	ld	(_shadow_VDP_R1+0), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00384$
	ei
00384$:
;smoketest.c:31: DISPLAY_ON;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x40
	ld	(_shadow_VDP_R1+0), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00386$
	ei
00386$:
;smoketest.c:35: SWITCH_ROM(BANK(earth_data));
	ld	hl, #_MAP_FRAME1
	ld	(hl), #<(___bank_earth_data)
;smoketest.c:36: if (banked_func(0xBE, 0xEF) == 0xBEEF) {
	ld	hl, #0xefbe
	push	hl
	ld	e, #b_banked_func
	ld	hl, #_banked_func
	call	___sdcc_bcall_ehl
	pop	af
	ld	a, e
	sub	a, #0xef
	jr	NZ, 00102$
	ld	a, d
	sub	a, #0xbe
	jr	NZ, 00102$
;smoketest.c:37: set_bkg_data(2, earth_data_size >> 4, earth_data);
	ld	de, #_earth_data
	ld	bc, (_earth_data_size)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;../../../include/sms/sms.h:560: set_tile_2bpp_data(start, ntiles, src, _current_2bpp_palette);
	ld	hl, (__current_2bpp_palette)
	push	hl
	push	de
	push	bc
	ld	hl, #0x0002
	push	hl
	call	_set_tile_2bpp_data
;smoketest.c:38: set_sprite_data(0, earth_data_size >> 4, earth_data);
	ld	de, #_earth_data
	ld	bc, (_earth_data_size)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;../../../include/sms/sms.h:563: set_tile_2bpp_data((uint8_t)(start) + 0x100u, ntiles, src, _current_2bpp_palette);
	ld	hl, (__current_2bpp_palette)
	push	hl
	push	de
	push	bc
	ld	hl, #0x0100
	push	hl
	call	_set_tile_2bpp_data
;../../../include/sms/sms.h:732: shadow_OAM[0x41+(nb << 1)] = tile;
	ld	hl, #(_shadow_OAM + 65)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 67)
	ld	(hl), #0x02
;smoketest.c:40: set_sprite_tile(1, 2);
00102$:
;smoketest.c:43: set_bkg_tiles(4, 10, 4, 2, tilemap);
	ld	hl, #_tilemap
	push	hl
	ld	hl, #0x204
	push	hl
	ld	hl, #0xa04
	push	hl
	call	_set_tile_map_compat
;smoketest.c:45: set_tile_map(4, 16, 4, 2, tilemapw);
	ld	hl, #_tilemapw
	push	hl
	ld	hl, #0x204
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_tile_map
;smoketest.c:47: joypad_init(2, &joy);
	ld	hl, #_joy
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_joypad_init
;smoketest.c:49: while(TRUE) {
00158$:
;smoketest.c:50: joypad_ex(&joy);
	ld	hl, #_joy
	call	_joypad_ex
;smoketest.c:52: if (joy.joy0 & J_LEFT) {
	ld	a, (#(_joy + 1) + 0)
	bit	2, a
	jr	Z, 00116$
;smoketest.c:53: if (xspd > -32) xspd -= 2;
	ld	a, #0xe0
	ld	hl, #_xspd
	sub	a, (hl)
	jp	PO, 00390$
	xor	a, #0x80
00390$:
	jp	P, 00117$
	ld	iy, #_xspd
	dec	0 (iy)
	dec	0 (iy)
	jr	00117$
00116$:
;smoketest.c:54: } else if (joy.joy0 & J_RIGHT) {
	bit	3, a
	jr	Z, 00113$
;smoketest.c:55: if (xspd < 32) xspd += 2;
	ld	a, (_xspd+0)
	xor	a, #0x80
	sub	a, #0xa0
	jr	NC, 00117$
	ld	iy, #_xspd
	inc	0 (iy)
	inc	0 (iy)
	jr	00117$
00113$:
;smoketest.c:57: if (xspd < 0) xspd++; else if (xspd > 0) xspd--;
	ld	a, (_xspd+0)
	bit	7, a
	jr	Z, 00110$
	ld	hl, #_xspd
	inc	(hl)
	jr	00117$
00110$:
	xor	a, a
	ld	hl, #_xspd
	sub	a, (hl)
	jp	PO, 00392$
	xor	a, #0x80
00392$:
	jp	P, 00117$
	ld	hl, #_xspd
	dec	(hl)
00117$:
;smoketest.c:60: if (joy.joy0 & J_UP) {
	ld	a, (#(_joy + 1) + 0)
	bit	0, a
	jr	Z, 00131$
;smoketest.c:61: if (yspd > -32) yspd -= 2;
	ld	a, #0xe0
	ld	hl, #_yspd
	sub	a, (hl)
	jp	PO, 00394$
	xor	a, #0x80
00394$:
	jp	P, 00132$
	ld	iy, #_yspd
	dec	0 (iy)
	dec	0 (iy)
	jr	00132$
00131$:
;smoketest.c:62: } else if (joy.joy0 & J_DOWN) {
	bit	1, a
	jr	Z, 00128$
;smoketest.c:63: if (yspd < 32) yspd += 2;
	ld	a, (_yspd+0)
	xor	a, #0x80
	sub	a, #0xa0
	jr	NC, 00132$
	ld	iy, #_yspd
	inc	0 (iy)
	inc	0 (iy)
	jr	00132$
00128$:
;smoketest.c:65: if (yspd < 0) yspd++; else if (yspd > 0) yspd--;
	ld	a, (_yspd+0)
	bit	7, a
	jr	Z, 00125$
	ld	hl, #_yspd
	inc	(hl)
	jr	00132$
00125$:
	xor	a, a
	ld	hl, #_yspd
	sub	a, (hl)
	jp	PO, 00396$
	xor	a, #0x80
00396$:
	jp	P, 00132$
	ld	hl, #_yspd
	dec	(hl)
00132$:
;smoketest.c:68: x += xspd;
	ld	a, (_xspd+0)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, (_x)
	add	hl, bc
	ld	(_x), hl
;smoketest.c:69: if (x < (8 << 4)) x = 8 << 4; else if (x > (30 * 8) << 4) x = (30 * 8) << 4;
	ld	a, (_x+0)
	sub	a, #0x80
	ld	a, (_x+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00136$
	ld	hl, #0x0080
	ld	(_x), hl
	jr	00137$
00136$:
	ld	hl, (_x)
	xor	a, a
	cp	a, l
	ld	a, #0x0f
	sbc	a, h
	jp	PO, 00397$
	xor	a, #0x80
00397$:
	jp	P, 00137$
	ld	hl, #0x0f00
	ld	(_x), hl
00137$:
;smoketest.c:72: y += yspd;
	ld	a, (_yspd+0)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, (_y)
	add	hl, bc
	ld	(_y), hl
;smoketest.c:73: if (y < 0) y = 0; else if (y > (22 * 8) << 4) y = (22 * 8) << 4;
	ld	bc, (_y)
	bit	7, b
	jr	Z, 00141$
	ld	hl, #0x0000
	ld	(_y), hl
	jr	00142$
00141$:
	xor	a, a
	cp	a, c
	ld	a, #0x0b
	sbc	a, b
	jp	PO, 00398$
	xor	a, #0x80
00398$:
	jp	P, 00142$
	ld	hl, #0x0b00
	ld	(_y), hl
00142$:
;smoketest.c:75: tick++; tick &= 7;
	ld	hl, #_tick
	inc	(hl)
	ld	a, (_tick+0)
	and	a, #0x07
	ld	(_tick+0), a
;smoketest.c:76: if (!tick) {
	ld	a, (_tick+0)
	or	a, a
	jr	NZ, 00146$
;smoketest.c:77: anim++; if (anim == 7) anim = 0;
	ld	iy, #_anim
	inc	0 (iy)
	ld	a, (_anim+0)
	sub	a, #0x07
	jr	NZ, 00144$
	ld	0 (iy), #0x00
00144$:
;smoketest.c:78: set_sprite_tile(0, anim << 2);
	ld	a, (_anim+0)
	add	a, a
	add	a, a
	ld	c, a
;../../../include/sms/sms.h:732: shadow_OAM[0x41+(nb << 1)] = tile;
	ld	hl, #(_shadow_OAM + 65)
	ld	(hl), c
;smoketest.c:79: set_sprite_tile(1, (anim << 2) + 2);
	ld	a, (_anim+0)
	add	a, a
	add	a, a
	add	a, #0x02
	ld	c, a
;../../../include/sms/sms.h:732: shadow_OAM[0x41+(nb << 1)] = tile;
	ld	hl, #(_shadow_OAM + 67)
	ld	(hl), c
;smoketest.c:79: set_sprite_tile(1, (anim << 2) + 2);
00146$:
;smoketest.c:82: move_sprite(0, x >> 4, y >> 4);
	ld	de, (_y)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	bc, (_x)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;../../../include/sms/sms.h:768: shadow_OAM[nb] = (y < VDP_SAT_TERM) ? y : 0xC0;
	ld	a, e
	sub	a, #0xd0
	jr	C, 00175$
	ld	e, #0xc0
00175$:
	ld	hl, #_shadow_OAM
	ld	(hl), e
;../../../include/sms/sms.h:769: shadow_OAM[0x40+(nb << 1)] = x;
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl), c
;smoketest.c:83: move_sprite(1, (x >> 4) + 8, y >> 4);
	ld	de, (_y)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	hl, (_x)
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	add	a, #0x08
	ld	c, a
;../../../include/sms/sms.h:768: shadow_OAM[nb] = (y < VDP_SAT_TERM) ? y : 0xC0;
	ld	a, e
	sub	a, #0xd0
	jr	C, 00177$
	ld	e, #0xc0
00177$:
	ld	hl, #(_shadow_OAM + 1)
	ld	(hl), e
;../../../include/sms/sms.h:769: shadow_OAM[0x40+(nb << 1)] = x;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), c
;smoketest.c:85: if (joy.joy1 & J_LEFT) {
	ld	hl, #(_joy + 2)
	ld	c, (hl)
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	a, (_shadow_VDP_RSCX+0)
	ld	e, a
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	ld	a, (_shadow_VDP_RSCY+0)
	ld	-1 (ix), a
;smoketest.c:85: if (joy.joy1 & J_LEFT) {
	bit	2, c
	jr	Z, 00150$
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	hl, #_shadow_VDP_RSCX
	ld	a, e
	add	a, #0x01
	ld	(hl), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCX+0)
	out	(_VDP_CMD), a
	ld	a, #0x88
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00403$
	ei
00403$:
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
;../../../include/sms/sms.h:217: __WRITE_VDP_REG(VDP_RSCY, (tmp < 0) ? 224 + tmp : tmp % 224u);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x00e0
	call	__moduint
	ld	hl, #_shadow_VDP_RSCY
	ld	(hl), e
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCY+0)
	out	(_VDP_CMD), a
	ld	a, #0x89
	out	(_VDP_CMD), a
	pop	af
	jp	PO,00151$
	ei
;smoketest.c:86: scroll_bkg(-1, 0);
	jr	00151$
00150$:
;smoketest.c:87: } else if (joy.joy1 & J_RIGHT) {
	bit	3, c
	jr	Z, 00151$
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	hl, #_shadow_VDP_RSCX
	ld	a, e
	add	a, #0xff
	ld	(hl), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCX+0)
	out	(_VDP_CMD), a
	ld	a, #0x88
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00408$
	ei
00408$:
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
;../../../include/sms/sms.h:217: __WRITE_VDP_REG(VDP_RSCY, (tmp < 0) ? 224 + tmp : tmp % 224u);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x00e0
	call	__moduint
	ld	hl, #_shadow_VDP_RSCY
	ld	(hl), e
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCY+0)
	out	(_VDP_CMD), a
	ld	a, #0x89
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00410$
	ei
00410$:
;smoketest.c:88: scroll_bkg(1, 0);
00151$:
;smoketest.c:90: if (joy.joy1 & J_UP) {
	ld	hl, #(_joy + 2)
	ld	a, (hl)
	ld	-4 (ix), a
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	a, (_shadow_VDP_RSCX+0)
	ld	-3 (ix), a
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	ld	a, (_shadow_VDP_RSCY+0)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;smoketest.c:90: if (joy.joy1 & J_UP) {
	bit	0, -4 (ix)
	jr	Z, 00155$
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	a, -3 (ix)
	ld	(_shadow_VDP_RSCX+0), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCX+0)
	out	(_VDP_CMD), a
	ld	a, #0x88
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00413$
	ei
00413$:
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	ld	a, -2 (ix)
	add	a, #0xff
	ld	e, a
	ld	a, #0x00
	adc	a, #0xff
	ld	d, a
;../../../include/sms/sms.h:217: __WRITE_VDP_REG(VDP_RSCY, (tmp < 0) ? 224 + tmp : tmp % 224u);
	ld	b, d
	bit	7, b
	jr	Z, 00182$
	ld	a, e
	add	a, #0xe0
	ld	e, a
	rlca
	sbc	a, a
	jr	00183$
00182$:
	ex	de, hl
	ld	de, #0x00e0
	call	__moduint
00183$:
	ld	hl, #_shadow_VDP_RSCY
	ld	(hl), e
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCY+0)
	out	(_VDP_CMD), a
	ld	a, #0x89
	out	(_VDP_CMD), a
	pop	af
	jp	PO,00156$
	ei
;smoketest.c:91: scroll_bkg(0, -1);
	jr	00156$
00155$:
;smoketest.c:92: } else if (joy.joy1 & J_DOWN) {
	bit	1, -4 (ix)
	jr	Z, 00156$
;../../../include/sms/sms.h:215: __WRITE_VDP_REG(VDP_RSCX, __READ_VDP_REG(VDP_RSCX) - x);
	ld	a, -3 (ix)
	ld	(_shadow_VDP_RSCX+0), a
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCX+0)
	out	(_VDP_CMD), a
	ld	a, #0x88
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00418$
	ei
00418$:
;../../../include/sms/sms.h:216: int16_t tmp = __READ_VDP_REG(VDP_RSCY) + y;
	pop	de
	pop	hl
	push	hl
	inc	hl
	push	de
;../../../include/sms/sms.h:217: __WRITE_VDP_REG(VDP_RSCY, (tmp < 0) ? 224 + tmp : tmp % 224u);
	ld	de, #0x00e0
	call	__moduint
	ld	hl, #_shadow_VDP_RSCY
	ld	(hl), e
	ld	a,i
	di
	push	af
	ld	a, (_shadow_VDP_RSCY+0)
	out	(_VDP_CMD), a
	ld	a, #0x89
	out	(_VDP_CMD), a
	pop	af
	jp	PO, 00420$
	ei
00420$:
;smoketest.c:93: scroll_bkg(0, 1);
00156$:
;smoketest.c:96: hUGE_dosound();
	call	_hUGE_dosound
;smoketest.c:97: vsync();
	call	_vsync
;smoketest.c:99: }
	jp	00158$
_tilemap:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x09	; 9
_tilemapw:
	.dw #0x0002
	.dw #0x0004
	.dw #0x0006
	.dw #0x0008
	.dw #0x0003
	.dw #0x0005
	.dw #0x0007
	.dw #0x0009
	.area _CODE
	.area _INITIALIZER
__xinit__x:
	.dw #0x0080
__xinit__y:
	.dw #0x0000
__xinit__xspd:
	.db #0x00	;  0
__xinit__yspd:
	.db #0x00	;  0
__xinit__anim:
	.db #0x00	; 0
__xinit__tick:
	.db #0x00	; 0
	.area _CABS (ABS)
