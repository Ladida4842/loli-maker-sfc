menucontrols:
LDA !joypressH
AND #$0C
BEQ ++
BIT #$08
BNE .up
.down
LDA !option
INC
STA !option
CMP #$0B
BCC +
STZ !option
BRA +
.up
LDA !option
DEC
STA !option
BPL +
LDA #$0A
STA !option
+
BRL .skip
++

LDA !changeflag
ORA !colorflag
BEQ +
BRL .skip
+

LDA !joypressH
AND #$03
BEQ +++
BIT #$02
BNE .left
.right
LDX !option
CPX #$0A
BEQ +
TXA : INC : STA !changeflag
LDA !hairtype,x
INC
STA !hairtype,x
CMP maxvalue,x
BCC ++
STZ !hairtype,x
++
BRA ++
.left
LDX !option
CPX #$0A
BEQ +
TXA : INC : STA !changeflag
LDA !hairtype,x
DEC
STA !hairtype,x
BPL ++
LDA maxvalue,x
DEC
STA !hairtype,x
++
BRL .skip
+
--
LDX #$0F
-
STZ !hairtype,x
DEX : BPL -
LDA #$FF : STA !changeflag : STA !colorflag
BRL .skip
+++

LDA !joypressL
AND #$30
BEQ .skip
BIT #$20
BNE .ell
.arr
LDY !option
CPY #$0A
BEQ --
LDX optioncolor,y
BMI .skip
TXA : INC : STA !colorflag
LDA !haircolor,x
INC
STA !haircolor,x
CMP maxcolor,x
BCC +
STZ !haircolor,x
+
BRA +
.ell
LDY !option
CPY #$0A
BEQ --
LDX optioncolor,y
BMI .skip
TXA : INC : STA !colorflag
LDA !haircolor,x
DEC
STA !haircolor,x
BPL +
LDA maxcolor,x
DEC
STA !haircolor,x
+

.skip
RTS


maxvalue:
db $08,$08,$08,$08,$08,$08	;hair, bangs, sides, eyes, mouth, nose
db $04,$01,$04,$02		;skin, clothes, clip, misc

optioncolor:
db $00,$00,$00,$01,$FF,$FF
db $02,$03,$04,$05

maxcolor:
db $08,$08,$08,$04,$04,$04


-
LDA #$06
--
PHA
JSR +
PLA
DEC A : BNE --
STZ !colorflag
RTS

colorpointers:
LDA !colorflag
BMI -
BEQ ++
JSR +
STZ !colorflag
++
RTS

+
DEC : PHA
ASL
CLC : ADC $01,s
TAX
LDA .points,x : STA $00
LDA .points+1,x : STA $01
LDA .points+2,x : STA $02
PLX
LDA !haircolor,x
ASL #3 : TAY

REP #$30
TXA : ASL : TAX
LDA .colloc,x
TAX
LDA #$0003 : STA $03
-
LDA [$00],y
STA !color,x
INY #2 : INX #2
DEC $03 : BPL -
LDX #$0006
-
LDA !color,x
STA !color+($60*2),x
LDA !color+($40*2),x
STA !color+($90*2),x
DEX #2 : BPL -
LDA !color+($02*2) : STA !color+($9A*2)
LDA !color+($03*2) : STA !color+($9B*2)
SEP #$30
RTS

.points
dl haircol_loc,eyecol_loc,skincol_loc
dl clothcol_loc,clipcol_loc,misccol_loc

.colloc
dw $00*2,$9C*2,$40*2,$20*2,$A4*2,$B4*2