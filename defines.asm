;$00-$0F		;RESERVED FOR SCRATCH RAM

!gamemode = $10		;game mode
!subgamemode = $11	;sub game mode
!brightness = $12	;brightness, stores to $2100
!frame = $13		;current frame #

!fadetimer = $14	;used for fade-ins and fade-outs

!joypressL = $15	;axlr----
!joypressH = $16	;byetUDLR
!joyheldL = $17		;axlr----
!joyheldH = $18		;byetUDLR
!joydisL = $19		;axlr----
!joydisH = $1A		;byetUDLR
!joyraw = $1B		;2 bytes. dont touch

;$1D			;EMPTY

!mainscr = $1E		;stores to $212C
!subscr = $1F		;stores to $212D

!layer1x = $20
!layer1y = $22
!layer2x = $24
!layer2y = $26
!layer3x = $28
!layer3y = $2A
!layer4x = $2C
!layer4y = $2E

!hdmareg = $30		;stores to $420C
!cgwsel = $31		;stores to $2130
!cgadsub = $32		;stores to $2131

!layer34gfx = $33

!bgcolor = $34	;fixed color in BGR555. converted to $2132

;$36-$7F		;EMPTY

!hairtype = $80
!bangtype = $81
!sidetype = $82
!eyestype = $83
!mouthtype = $84
!nosetype = $85
!skintype = $86
!clothtype = $87
!cliptype = $88
!misctype = $89
!haircolor = $8A
!eyescolor = $8B
!skincolor = $8C
!clothcolor = $8D
!clipcolor = $8E
!misccolor = $8F

!option = $90		;current option selected (essentially pseudo-ypos of cursor)
!changeflag = $91	;when left/right is pressed (and controls arent disabled),
			;this gets set. signifies that gfx need to be changed
			;cleared during gfx update (when finished)
			;will = FF if gfx are reset
!colorflag = $92	;same as above, but for colors

;$93-$9F		;EMPTY

!hairtypepointer = $A0	;3 bytes, pointer to hair style
!bangtypepointer = $A3	;3 bytes, pointer to bang style
!sidetypepointer = $A6	;3 bytes, pointer to side style
!eyestypepointer = $A9	;3 bytes, pointer to eyes style
!mouthtypepointer = $AC	;3 bytes, pointer to mouth style
!nosetypepointer = $AF	;3 bytes, pointer to nose style
!skintypepointer = $B2	;3 bytes, pointer to skin style
!clothtypepointer = $B5	;3 bytes, pointer to cloth style
!cliptypepointer = $B8	;3 bytes, pointer to clip style
!misctypepointer = $BB	;3 bytes, pointer to misc style
!haircolorpointer = $BE	;3 bytes, pointer to hair color
!eyescolorpointer = $C1	;3 bytes, pointer to eyes color
!skincolorpointer = $C4	;3 bytes, pointer to skin color
!clothcolorpointer = $C7;3 bytes, pointer to cloth color
!clipcolorpointer = $CA	;3 bytes, pointer to clip color
!misccolorpointer = $CD	;3 bytes, pointer to misc color

;$D0-$FF		;EMPTY

;$0100-$01FF		;RESERVED FOR STACK

!oam = $0200
!oamx = !oam+0
!oamy = !oam+1
!oamt = !oam+2
!oamp = !oam+3
!hoam = !oam+$0100
!hoamx = !hoam+0
!hoamy = !hoam+1
!hoamt = !hoam+2
!hoamp = !hoam+3
!oamup = !oam+$0200
!oamdata = !oamup+$0020
!hoamdata = !oamdata+$0040

!color = $0500		;entire palette. 512 bytes

;$0700-$1FFF		;EMPTY

;$2000+			;EMPTY