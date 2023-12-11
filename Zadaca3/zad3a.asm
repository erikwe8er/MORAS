@0
D = M;
@start
M = D;
@1
M = M - 1;

$WHILE(1)
@start
D = M;
@help
M = D;
@2
M = 0;
$WHILE(help)
$SUM(0,2,2)
@help
M = M - 1;
$END
$MV(2,0)
@1
M = M - 1;
$END


(END) 
@END
0; JMP
