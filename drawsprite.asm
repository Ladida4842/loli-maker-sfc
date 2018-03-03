drawsprite:
LDY #$00

.misc
LDA #$33 : STA !hoamx,y
LDA #$43 : STA !hoamx+4,y
LDA #$53 : STA !hoamx+8,y
LDA #$4E : STA !hoamy,y : STA !hoamy+4,y : STA !hoamy+8,y
LDA #$C0 : STA !hoamt,y
LDA #$C2 : STA !hoamt+4,y
LDA #$C4 : STA !hoamt+8,y
LDA #$37 : STA !hoamp,y : STA !hoamp+4,y : STA !hoamp+8,y
PHY : TYA : LSR #2 : TAY
LDA #$02 : STA !hoamdata,y
STA !hoamdata+1,y : STA !hoamdata+2,y
PLY
INY #$0C

LDX #$0B
.eyes
LDA .eyedata-$C,y : STA !hoamx,y
LDA .eyedata-$C+1,y : STA !hoamy,y
LDA .eyedata-$C+2,y : STA !hoamt,y
LDA .eyedata-$C+3,y : STA !hoamp,y
PHY : TYA : LSR #2 : TAY
LDA #$02 : STA !hoamdata,y
PLY
INY #4
DEX : BPL .eyes

.nose
LDA #$3D : STA !hoamx,y
LDA #$54 : STA !hoamy,y
LDA #$60 : STA !hoamt,y
LDA #$13 : STA !hoamp,y
PHY : TYA : LSR #2 : TAY
LDA #$02 : STA !hoamdata,y
PLY
INY #4

.mouth
LDA #$3A : STA !hoamx,y
LDA #$4A : STA !hoamx+4,y
LDA #$5E : STA !hoamy,y
STA !hoamy+4,y
LDA #$40 : STA !hoamt,y
LDA #$42 : STA !hoamt+4,y
LDA #$13 : STA !hoamp,y
STA !hoamp+4,y
PHY : TYA : LSR #2 : TAY
LDA #$02 : STA !hoamdata,y
STA !hoamdata+1,y
PLY
INY #8

.clip
LDA #$60 : STA !hoamx,y
LDA #$40 : STA !hoamy,y
LDA #$80 : STA !hoamt,y
LDA #$35 : STA !hoamp,y
PHY : TYA : LSR #2 : TAY
LDA #$02 : STA !hoamdata,y
PLY
INY #4

RTS

.eyedata
db $2F,$45,$00,$13	;left eye tl
db $3F,$45,$02,$13	;left eye tr
db $2F,$55,$20,$13	;left eye bl
db $3F,$55,$22,$13	;left eye br
db $45,$45,$04,$13	;right eye tl
db $55,$45,$06,$13	;right eye tr
db $45,$55,$24,$13	;right eye bl
db $55,$55,$26,$13	;right eye br
db $2F,$40,$08,$13	;left eyebrow l
db $3F,$40,$0A,$13	;left eyebrow r
db $45,$40,$0C,$13	;right eyebrow l
db $55,$40,$0E,$13	;right eyebrow r