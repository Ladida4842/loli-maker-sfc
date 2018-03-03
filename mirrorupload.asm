LDA !layer1x : STA $210D
LDA !layer1x+1 : STA $210D
LDA !layer1y : STA $210E
LDA !layer1y+1 : STA $210E
LDA !layer2x : STA $210F
LDA !layer2x+1 : STA $210F
LDA !layer2y : STA $2110
LDA !layer2y+1 : STA $2110
LDA !layer3x : STA $2111
LDA !layer3x+1 : STA $2111
LDA !layer3y : STA $2112
LDA !layer3y+1 : STA $2112
LDA !layer4x : STA $2113
LDA !layer4x+1 : STA $2113
LDA !layer4y : STA $2114
LDA !layer4y+1 : STA $2114
REP #$20 : LDA !bgcolor : ASL #3
SEP #$21 : ROR #3 : XBA
ORA #$40 : STA $2132
LDA !bgcolor+1 : LSR
SEC : ROR : STA $2132
XBA : STA $2132
REP #$20
STZ !color
LDA !cgwsel : STA $2130
LDA !mainscr : STA $212C
STZ $2102
LDA #$0400 : STA $4300
TAY : STY $2121
LSR : STA $4315
LDA #!oam : STA $4302
LDY #$7E : STY $4304 : STY $4314
LDA #$0220 : STA $4305
LDA #!color : STA $4312
LDA #$2202 : STA $4310
SEP #$20
INC : STA $420B