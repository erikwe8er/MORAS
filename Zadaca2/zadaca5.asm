@SCREEN
D = A;
@letter_start
M = D;

@cnt
M = 1;

@SCREEN
D = A;
@temp_pos
M = D;

@add
M = 0;

@line_counter
M = 1;

@del_cnt
M = 1;

(WRITING_START)
//ESC TO END
@24576
D = M;
@140
D = D - A;
@END
D; JEQ

//SLOVO A
@24576
D = M;
@65
D = D - A;
@A_START
D; JEQ

//SLOVO E
@24576
D = M;
@69
D = D - A;
@E_START
D; JEQ

//SLOVO I 
@24576
D = M;
@73
D = D - A;
@I_START
D; JEQ

//SLOVO O
@24576
D = M;
@79
D = D - A;
@O_START
D; JEQ

//SLOVO U
@24576
D = M;
@85
D = D - A;
@U_START
D; JEQ

//DELETE
@24576
D = M;
@48
D = D - A;
@DELETE_START
D; JEQ

@cnt
D = M;
@POSITION_UPDATE_START
D; JEQ

@del_cnt
M = 1;

@WRITING_START
0; JMP
(WRITING_END)

//SLOVO A ##################################
(A_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@cnt
D = M;
@WRITING_START
D; JEQ

@128
D = A;
@letter_start
D = M + D;
@temp_pos
M = D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;
 
@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@8128
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@8128
D = A;
@temp_pos
A = M;
M = D;

@cnt
M = 0;

@A_START
0; JMP
(A_END)


//SLOVO E ###########################################
(E_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@cnt
D = M;
@WRITING_START
D; JEQ

@128
D = A;
@letter_start
D = M + D;
@temp_pos
M = D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@2016
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@2032
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@48
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@2032
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@1984
D = A;
@temp_pos
A = M;
M = D;

@cnt
M = 0;

@E_START
0; JMP
(E_END)

//SLOVO I #############################
(I_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@cnt
D = M;
@WRITING_START
D; JEQ

@128
D = A;
@letter_start
D = M + D;
@temp_pos
M = D;
@384
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@384
D = A;
@temp_pos
A = M;
M = D;

@96
D = A;
@temp_pos
M = M + D;
@384
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@384
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@384
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@384
D = A;
@temp_pos
A = M;
M = D;

@cnt
M = 0;

@I_START
0; JMP
(I_END)

//SLOVO O ###############################
(O_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@cnt
D = M;
@WRITING_START
D; JEQ

@128
D = A;
@letter_start
D = M + D;
@temp_pos
M = D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@960
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@960
D = A;
@temp_pos
A = M;
M = D;

@cnt
M = 0;

@O_START
0; JMP
(O_END)

//SLOVO U ###############################
(U_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@cnt
D = M;
@WRITING_START
D; JEQ

@128
D = A;
@letter_start
D = M + D;
@temp_pos
M = D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@3120
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@2016
D = A;
@temp_pos
A = M;
M = D;

@32
D = A;
@temp_pos
M = M + D;
@960
D = A;
@temp_pos
A = M;
M = D;

@cnt
M = 0;

@U_START
0; JMP
(U_END)

//DELETE #################################
(DELETE_START)
@SCREEN
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@del_cnt
D = M;
@WRITING_START
D; JEQ

@line_counter
D = M - 1;
@DELETE_LAST_START
D; JEQ

@letter_start
M = M - 1;
A = M;
M = 0;

@32
D = A;

@letter_start
A = M;

A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;
A = A + D;
M = 0;

@del_cnt
M = 0;

@line_counter
M = M - 1;

@DELETE_START
0; JMP
(DELETE_END)

(POSITION_UPDATE_START)
@cnt
D = M - 1;
@WRITING_START
D; JEQ

@line_counter
D = M;
@32
D = D - A;
@NEXT_ROW_START
D; JEQ


@letter_start
M = M + 1;
D = M;
@temp_pos
M = D;

@cnt
M = 1;
@line_counter
M = M + 1;

@POSITION_UPDATE_START
0; JMP
(POSITION_UPDATE_END)

(NEXT_ROW_START)
@24544
D = A;
@letter_start
D = D - M;
@WRITING_START
D; JEQ

@line_counter
D = M;
@WRITING_START
D; JEQ

@448
D = A;
@letter_start
M = M + D;
D = M;
@temp_pos
M = D;

@line_counter
M = 0;

@NEXT_ROW_START
0; JMP
(NEXT_ROW_END)

(DELETE_LAST_START)
@del_cnt
D = M;
@WRITING_START
D; JEQ

@letter_start
M = M - 1;
A = M;
M = 0;

@32
D = A;

@letter_start
A = M - D;

A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;
A = A - D;
M = 0;

D = A;
@letter_start
M = D;

@32
D = A;
@line_counter
M = D;

@del_cnt
M = 0;

@DELETE_LAST_START
0; JMP
(DELETE_LAST_END)

(END)
@END
0;JMP