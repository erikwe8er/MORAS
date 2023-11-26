// i za gornju stranicu
@737
D = A;
@i
M = D;

//k,l za lijevu i desnu stranicu
@32
D = D + A;
@SCREEN
D = D + A;
@k
M = D;

@7
D = D + A;
@l 
M = D;

//j za donju stranicu
@4801
D = A;
@j 
M = D;

//rub zbog dijagonale
@edge
M = 1;

//diagonala LR
@1
D = A;
@cnt 
M = D;

@1
D = A;
@cnt1
M = D;

@2
D = A;
@val
M = D;

@1
D = A;
@val_help
M = D;

@minus
M = 0;

@769
D = A;
@SCREEN
D = D + A;
@diag_lu 
M = D;

@21153
D = A;
@diag_ld 
M = D;



//crta gornju i donju stranicu
(LOOP_UP_DOWN_START)
@i
D = M;
@745
D = D - A;
@LOOP_SIDES_START
D; JGE

@i
D = M;
@SCREEN
A = A + D;
M = -1;

@j 
D = M;
@SCREEN
A = A + D;
M = -1;

@i
M = M + 1;
@j 
M = M + 1;
@LOOP_UP_DOWN_START
0;JMP
(LOOP_UP_DOWN_END)




(LOOP_SIDES_START)
@k 
D = M;
@SCREEN
D = D - A;
@4801
D = D - A;
@LOOP_DIAG_LR_START
D; JGE

@k 
A = M;
M = 1;
D = A;

@24576
D = A;
@8192
D = D + A;
@l 
A = M;
M = -D;

@32
D = A;
@k 
M = M + D;
@l 
M = M + D;
@LOOP_SIDES_START
0;JMP
(LOOP_SIDES_END)



//loop koji vraca sve na default
(LOOP_CHANGE_START)
@val
D = M;
@1
D = D - A;
@LOOP_CHANGE_END
D; JEQ

@edge
M = 0;
@1
D = A;
@val
M = D;
@diag_lu
M = M + 1;
@diag_ld 
M = M + 1;
@LOOP_CHANGE_START
0;JMP
(LOOP_CHANGE_END)



//loop koji povecava value 
(INC_LOOP_START)
@cnt1
D = M;
@INC_LOOP_END
D; JEQ

@val
D = M;
M = M + D;
D = M;
@cnt1
M = M - 1;

@INC_LOOP_START
0; JMP
(INC_LOOP_END)



//dijagonala LR
(LOOP_DIAG_LR_START)
@val
D = M;
@LOOP_CHANGE_START
D; JEQ

@val
D = M;
@edge
D = D + M;
@diag_lu
A = M;
M = D;
@diag_ld 
A = M;
M = D;

@20680
D = A;
@diag_lu
D = D - M;
@LOOP_END_VALS_START
D; JLE

@32
D = A;
@diag_lu
M = M + D;
@diag_ld 
M = M - D;
@cnt
D = M;
@cnt1
M = D;

@INC_LOOP_START
0;JMP

@LOOP_DIAG_LR_START
0;JMP
(LOOP_DIAG_LR_END)

(LOOP_END_VALS_START)
@val 
D = M;
@24576
D = D + A;
@8191
D = D + A;
@LOOP_END_DIAGS_START
D; JEQ

@24576
D = A;
@8191
D = D + A;
@val
M = -D;
@17576
D = A;
@diag_lu
M = D;
@20744
D = A;
@diag_ld
M = D;
@val
D = M;
@20712
M = D;
@17608
M = D;
(LOOP_END_VALS_END)

(UPDATE_VAL_START)
@cnt
D = M;
@UPDATE_VAL_END
D; JEQ

@val_help
D = M;
M = M + D;
@val
M = M + D;
@cnt
M = 0;

@UPDATE_VAL_START
0;JMP
(UPDATE_VAL_END)

(LOOP_END_DIAGS_START)
@17128
D = A;
@diag_lu
D = D - M;
@LOOP_END_DIAGS_END
D; JEQ


@cnt
M = 1;
@val
D = M;
@diag_lu
A = M;
M = D;
@diag_ld
A = M;
M = D;


@32
D = A;
@diag_lu
M = M - D;
@diag_ld
M = M + D;

@UPDATE_VAL_START
0;JMP

@LOOP_END_DIAGS_START
0; JMP
(LOOP_END_DIAGS_END)

(END)
@END
0;JMP