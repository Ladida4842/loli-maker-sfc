joypad:
LDA $4212
LSR : BCS joypad
REP #$30
LDX $4218
LDA !joyraw
STX !joyraw
AND !joyraw
STA !joyheldL
EOR !joyraw
STA !joypressL
LDA !joydisL
TRB !joypressL
TRB !joyheldL
STZ !joydisL
SEP #$30
RTS