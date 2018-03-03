killspritelong:
PHB : PHK : PLB
JSR killsprite
PLB : RTL

macro killspriteSTA()
STX $01 : STX $05 : STX $09 : STX $0D
STX $11 : STX $15 : STX $19 : STX $1D
STX $21 : STX $25 : STX $29 : STX $2D
STX $31 : STX $35 : STX $39 : STX $3D
STX $41 : STX $45 : STX $49 : STX $4D
STX $51 : STX $55 : STX $59 : STX $5D
STX $61 : STX $65 : STX $69 : STX $6D
STX $71 : STX $75 : STX $79 : STX $7D
STX $81 : STX $85 : STX $89 : STX $8D
STX $91 : STX $95 : STX $99 : STX $9D
STX $A1 : STX $A5 : STX $A9 : STX $AD
STX $B1 : STX $B5 : STX $B9 : STX $BD
STX $C1 : STX $C5 : STX $C9 : STX $CD
STX $D1 : STX $D5 : STX $D9 : STX $DD
STX $E1 : STX $E5 : STX $E9 : STX $ED
STX $F1 : STX $F5 : STX $F9 : STX $FD
endmacro

killsprite:
PHD
REP #$20
LDA #!oam : TCD
LDX #$F0
%killspriteSTA()
LDA #!hoam : TCD
%killspriteSTA()
SEP #$20
PLD
RTS

macro oamstuffORA(upl)
LDA.b !oamdata+(<upl>*4)+7 : ASL #2
ORA.b !oamdata+(<upl>*4)+6 : ASL #2
ORA.b !oamdata+(<upl>*4)+5 : ASL #2
ORA.b !oamdata+(<upl>*4)+4
STA.b !oamup+<upl>+1
LDA.b !oamdata+(<upl>*4)+3 : ASL #2
ORA.b !oamdata+(<upl>*4)+2 : ASL #2
ORA.b !oamdata+(<upl>*4)+1 : ASL #2
ORA.b !oamdata+(<upl>*4)+0
STA.b !oamup+<upl>
endmacro

oamstuff:
PHD : PEA !oamup : PLD
%oamstuffORA($1E)
%oamstuffORA($1C)
%oamstuffORA($1A)
%oamstuffORA($18)
%oamstuffORA($16)
%oamstuffORA($14)
%oamstuffORA($12)
%oamstuffORA($10)
%oamstuffORA($0E)
%oamstuffORA($0C)
%oamstuffORA($0A)
%oamstuffORA($08)
%oamstuffORA($06)
%oamstuffORA($04)
%oamstuffORA($02)
%oamstuffORA($00)
PLD
RTS