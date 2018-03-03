gfxupload:
LDA !changeflag
BMI ++
BEQ +
JSR .gfx
-
STZ !changeflag
+
.return
RTS

++
DEC
STA !changeflag
SEC : SBC #$F4
BEQ -
JSR .gfx
JMP .return

.gfx
DEC : PHA
ASL : TAY
CLC : ADC $01,s
TAX
PLA
LDA #$80 : STA $2115
REP #$20
LDA .vrampointer,y : STA $2116
LDA #$1801 : STA $4310
LDA !hairtypepointer,x : STA $4312
LDA .uploadlength,y : STA $4315
LDY !hairtypepointer+2,x : STY $4314
SEP #$20
LDA #$02 : STA $420B
RTS


.vrampointer
dw $3000,$0000,$0800	;hair,bangs,sides
dw $7000,$7400,$7600	;eyes, mouth, nose
dw $2000,$1000,$7800	;skin,clothes,clip
dw $7C00		;misc

.uploadlength
dw $2000,$0800,$1000
dw $0800,$0400,$0400
dw $1000,$1000,$0800
dw $0800


-
CMP #$FF
BNE +
LDA #$0A
--
PHA
JSR ++
PLA
DEC A : BNE --
+
RTS

pointeradjust:
LDA !changeflag
BMI -

++
DEC
TAX
ASL : TAY
LDA gfxupload_uploadlength,y
STA $211B
LDA gfxupload_uploadlength+1,y
STA $211B
LDA !hairtype,x
STA $211C
PHX
TYA
CLC : ADC $01,s
TAX
PLA
REP #$21
LDA .points,x
ADC $2134
STA !hairtypepointer,x
SEP #$20
LDA .points+2,x
ADC #$00
ADC $2136
STA !hairtypepointer+2,x
RTS

.points
dl hair_loc,fringe_loc,sides_loc
dl eyes_loc,mouth_loc,nose_loc
dl skin_loc,clothes_loc,clips_loc
dl misc_loc