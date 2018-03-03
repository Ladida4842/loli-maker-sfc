db $BC,$AE,$B3,$BC,$DE,$AE	;SHI yo U SHI " yo
db $20
db $D2,$B0,$B6,$B0		;ME - KA -
db "          "	;ROM title 21 bytes
db $21		;ROM layout (HiROM)
db $00		;Cartridge type (ROM+SRAM)
db $09		; ROM size (32MBit, or 4MB)
db $00		; SRAM size (1MBit, or 128KB)
db $00		;Country code (Japan NTSC)
db $00		;Licensee code (Null)
db $00		;Version number (v1.0)
dw ~$0000 	;Check sum complement
dw $0000 	;Check sum

dw $FFFF,$FFFF 	;[null]
dw $FFFF 	;	COP	(native)
dw BRK 		;	BRK	(native)
dw $FFFF 	;	ABORT	(native)
dw NMI		;	NMI	(native)
dw $FFFF	;[null]	RESET	(native)
dw $FFFF	;	IRQ	(native)
dw $FFFF,$FFFF 	;[null]
dw $FFFF	;	COP	(emulation)
dw $FFFF	;[null] BRK	(emulation)
dw $FFFF	;	ABORT	(emulation)
dw $FFFF	;	NMI	(emulation)
dw RESET	;	RESET	(emulation)
dw $40FF	;	IRQ	(emulation) (also BRK)