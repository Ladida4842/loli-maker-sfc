hirom
incsrc macros.asm
incsrc defines.asm

org $008000
RESET:
SEI
STZ $4200
CLC : XCE
ROR : STA $2100
STZ $420C
REP #$38
LDA #$01FF : TCS
LDA #$0000 : TCD
PHK : PLB
LDX #$1FFE
-
STZ $00,x
DEX #2 : BPL -
SEP #$30

STZ $2105
STZ $2123
STZ $2124
STZ $2125
STZ $2133
LDA #$03
STA $2101
STZ $2106
LDA #$50 : STA $2107
LDA #$54 : STA $2108
LDA #$58 : STA $2109
LDA #$5C : STA $210A
LDA #$10 : STA $210B
LDA #$32 : STA $210C

LDA #$0F : STA !brightness
LDA #$02 : STA !cgwsel
LDA #$20 : STA !cgadsub
LDA #$1F : STA !mainscr
STZ !subscr
LDA #$FF : STA !bgcolor
LDA #$7F : STA !bgcolor+1
LDA #$FF : STA !changeflag : STA !colorflag

LDA #$80 : STA $2115
REP #$20
LDA #$6000 : STA $2116
LDA #$1801 : STA $4310
LDA.w #defaulttext : STA $4312
LDX.b #defaulttext>>16 : STX $4314
LDA #$1000 : STA $4315
LDX #$02 : STX $420B
SEP #$20

REP #$20
LDA defaultpal+$0 : STA !color+($94*2)
LDA defaultpal+$2 : STA !color+($95*2)
LDA defaultpal+$4 : STA !color+($96*2)
LDA defaultpal+$6 : STA !color+($97*2)
LDA defaultpal+$8 : STA !color+($98*2)
LDA defaultpal+$A : STA !color+($99*2)
LDA defaultpal+$C : STA !color+($9A*2)
LDA defaultpal+$E : STA !color+($9B*2)
LDA defaultpal+$10 : STA !color+($A1*2) : STA !color+($B1*2)
LDA defaultpal+$12 : STA !color+($A2*2) : STA !color+($B2*2)
LDA defaultpal+$14 : STA !color+($A3*2) : STA !color+($B3*2)
SEP #$20

LDA #$80 : STA $2115
REP #$20
LDA #$5C00 : STA $2116
LDA #$1801 : STA $4310
LDA.w #L4map : STA $4312
LDX.b #L4map>>16 : STX $4314
LDA #$0800 : STA $4315
LDX #$02 : STX $420B
SEP #$20

LDA #$80 : STA $2115
REP #$20
LDA #$5800 : STA $2116
LDA #$1801 : STA $4310
LDA.w #L3map : STA $4312
LDX.b #L3map>>16 : STX $4314
LDA #$0800 : STA $4315
LDX #$02 : STX $420B
SEP #$20

LDA #$80 : STA $2115
REP #$20
LDA #$5400 : STA $2116
LDA #$1801 : STA $4310
LDA.w #L2map : STA $4312
LDX.b #L2map>>16 : STX $4314
LDA #$0800 : STA $4315
LDX #$02 : STX $420B
SEP #$20

LDA #$80 : STA $2115
REP #$20
LDA #$5000 : STA $2116
LDA #$1801 : STA $4310
LDA.w #L1map : STA $4312
LDX.b #L1map>>16 : STX $4314
LDA #$0800 : STA $4315
LDX #$02 : STX $420B
SEP #$20

STZ !color+$102 : STZ !color+$103

LDA #$81
STA $4200
BRA +
-
WAI
INC !frame
+
JSR killsprite
JSR maincode
JSR oamstuff
BRA -


NMI:
%pushall(0)
LDA $4210
LDA #$80
STA $2100
STZ $420C
JSR gfxupload
incsrc mirrorupload.asm
JSR joypad
LDA #$81
STA $4200
LDA !brightness
STA $2100
LDA !hdmareg
STA $420C
%pullall(0)
RTI

incsrc joypad.asm

incsrc spritestuff.asm

incsrc gfxupload.asm

BRK:
SEP #$30
PHK : PLB
STZ $4200 : STZ $420C
PEA $2100 : PLD
STZ $30 : STZ $33 : STZ $2C : STZ $31
STZ $21 : LDA #$FF : STA $22 : STA $22
LDA #$0F : STA $00
EOR #$80 : BRA $FA


maincode:
JSR menucontrols
JSR drawmenu
JSR pointeradjust
JSR colorpointers
JSR drawsprite
RTS

incsrc menucontrols.asm
incsrc menu.asm
incsrc drawsprite.asm


org $400000
defaulttext:
incbin text.bin
defaultpal:
incbin defaultcol.bin
L1map:
	incbin L1map.bin
L2map:
	incbin L2map.bin
L3map:
	incbin L3map.bin
L4map:
	incbin L4map.bin

cleartable
org $00FFC0
incsrc romlayout.asm
warnpc $410000

org $410000
hair_loc:
	incbin attributes/hair.bin

org $420000
fringe_loc:
	incbin attributes/fringe.bin
sides_loc:
	incbin attributes/sides.bin
eyes_loc:
	incbin attributes/eyes.bin

org $430000
mouth_loc:
	incbin attributes/mouth.bin
nose_loc:
	incbin attributes/nose.bin
clothes_loc:
	incbin attributes/clothes.bin
clips_loc:
	incbin attributes/clips.bin
misc_loc:
	incbin attributes/misc.bin

org $440000
skin_loc:
	incbin attributes/skin.bin

org $450000
haircol_loc:
	incbin attributes/haircolor.bin
eyecol_loc:
	incbin attributes/eyescolor.bin
skincol_loc:
	incbin attributes/skincolor.bin
clothcol_loc:
	incbin attributes/clothescolor.bin
clipcol_loc:
	incbin attributes/clipscolor.bin
misccol_loc:
	incbin attributes/misccolor.bin


org $47FFFF
db $FF