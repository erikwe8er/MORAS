@0
D = M;

@100
D = D + A;
@index
M = D + 1;
@iterator 
M = D + 1;

$WHILE(0)

(SORT_START)
@100
D = A;
@index
D = D - M;
@SORT_END
D; JEQ

@index
M = M - 1;

@index
A = M;
D = M;
A = A - 1;
D = D - M;
@SORT_START
D; JGE

@index
A = M;
D = M;
@temp
M = D;
@index
A = M - 1;
D = M;
A = A + 1;
M = D;
@temp
D = M;
@index
A = M - 1;
M = D;

@SORT_START
0; JMP
(SORT_END)

@iterator
D = M;
@index
M = D;

@0
M = M - 1;
$END

(END) 
@END
0; JMP 