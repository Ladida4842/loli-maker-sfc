drawmenu:
LDX #$00 : LDY #$00
LDA #$C0 : STA $00	;x position
LDA #$30 : STA $01	;y position
LDA #$04 : STA $02
LDA #$0A : STA $03
-
LDA $00 : STA !oamx,y
LDA $01 : STA !oamy,y
LDA menutiles,x : STA !oamt,y
LDA #$30 : STA !oamp,y
PHY
TYA
LSR #2
TAY
LDA #$00
STA !oamdata,y
PLY
INX
INY #4
LDA $00 : CLC : ADC #$08 : STA $00
DEC $02 : BPL -
LDA $00 : SEC : SBC #$28 : STA $00
LDA $01 : CLC : ADC #$08 : STA $01
LDA #$04 : STA $02
DEC $03 : BPL -

LDA #$B6 : STA !oamx,y
CLC : ADC #$34
STA !oamx+4,y
LDA !option
ASL #3
CLC : ADC #$30
STA !oamy,y : STA !oamy+4,y
LDA #$3C : STA !oamt,y
LDA #$3E : STA !oamt+4,y
LDA #$30 : STA !oamp,y : STA !oamp+4,y
PHY
TYA
LSR #2
TAY
LDA #$00
STA !oamdata,y
STA !oamdata+1,y
PLY
INY #8

RTS

menutiles:
db "Hair "
db "Bangs"
db "Sides"
db "Eyes "
db "Mouth"
db "Nose "
db "Skin "
db "Cloth"
db "Clips"
db "Misc."
db "Reset"