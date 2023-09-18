;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Linux)
;--------------------------------------------------------
	.module assets
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _earth_data_size
	.globl _earth_data
	.globl b___func_earth_data_size
	.globl ___func_earth_data_size
	.globl b___func_earth_data
	.globl ___func_earth_data
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
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
	.area _CODE_2
;assets.c:5: BANKREF(earth_data)
;	---------------------------------
; Function __func_earth_data
; ---------------------------------
	b___func_earth_data	= 2
___func_earth_data::
	.local b___func_earth_data 
	___bank_earth_data = b___func_earth_data 
	.globl ___bank_earth_data 
;assets.c:45: BANKREF(earth_data_size)
;	---------------------------------
; Function __func_earth_data_size
; ---------------------------------
	b___func_earth_data_size	= 2
___func_earth_data_size::
	.local b___func_earth_data_size 
	___bank_earth_data_size = b___func_earth_data_size 
	.globl ___bank_earth_data_size 
	.area _CODE_2
_earth_data:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x32	; 50	'2'
	.db #0x2d	; 45
	.db #0x71	; 113	'q'
	.db #0x4e	; 78	'N'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xf8	; 248
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x83	; 131
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x5c	; 92
	.db #0xa4	; 164
	.db #0x9e	; 158
	.db #0x62	; 98	'b'
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x5e	; 94
	.db #0xa2	; 162
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xb7	; 183
	.db #0xc8	; 200
	.db #0x63	; 99	'c'
	.db #0x5c	; 92
	.db #0x43	; 67	'C'
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x7e	; 126
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xc6	; 198
	.db #0x3a	; 58
	.db #0xe6	; 230
	.db #0x1a	; 26
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7d	; 125
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0x83	; 131
	.db #0xfc	; 252
	.db #0xd7	; 215
	.db #0xa8	; 168
	.db #0xbb	; 187
	.db #0xc4	; 196
	.db #0x6e	; 110	'n'
	.db #0x51	; 81	'Q'
	.db #0x7c	; 124
	.db #0x43	; 67	'C'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0x90	; 144
	.db #0xef	; 239
	.db #0x89	; 137
	.db #0xf6	; 246
	.db #0x8d	; 141
	.db #0xf2	; 242
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x5e	; 94
	.db #0x61	; 97	'a'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0xd8	; 216
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x2c	; 44
	.db #0xd4	; 212
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x3e	; 62
	.db #0xc2	; 194
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0xb6	; 182
	.db #0x4a	; 74	'J'
	.db #0xe4	; 228
	.db #0x1c	; 28
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0xee	; 238
	.db #0x91	; 145
	.db #0xf1	; 241
	.db #0x8e	; 142
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0xf1	; 241
	.db #0x8e	; 142
	.db #0x71	; 113	'q'
	.db #0x4e	; 78	'N'
	.db #0x72	; 114	'r'
	.db #0x4d	; 77	'M'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x92	; 146
	.db #0x6e	; 110	'n'
	.db #0xd6	; 214
	.db #0x2a	; 42
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xec	; 236
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x36	; 54	'6'
	.db #0x29	; 41
	.db #0x5c	; 92
	.db #0x63	; 99	'c'
	.db #0x6c	; 108	'l'
	.db #0x53	; 83	'S'
	.db #0xce	; 206
	.db #0xb1	; 177
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x9e	; 158
	.db #0xe1	; 225
	.db #0xae	; 174
	.db #0xd1	; 209
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0x32	; 50	'2'
	.db #0xce	; 206
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0xe4	; 228
	.db #0x2c	; 44
	.db #0xd4	; 212
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x33	; 51	'3'
	.db #0x2c	; 44
	.db #0x49	; 73	'I'
	.db #0x76	; 118	'v'
	.db #0x42	; 66	'B'
	.db #0x7d	; 125
	.db #0xc4	; 196
	.db #0xbb	; 187
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xc1	; 193
	.db #0xbe	; 190
	.db #0xe2	; 226
	.db #0x9d	; 157
	.db #0xf3	; 243
	.db #0x8c	; 140
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x47	; 71	'G'
	.db #0x3c	; 60
	.db #0x23	; 35
	.db #0x1c	; 28
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x68	; 104	'h'
	.db #0x98	; 152
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0xee	; 238
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1e	; 30
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_earth_data_size:
	.dw #0x01c0
	.area _INITIALIZER
	.area _CABS (ABS)
