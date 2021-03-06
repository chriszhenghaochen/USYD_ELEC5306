X = [52     55     61     66     70     61     64     73;
    63     59     66     90   109     85     69     72;
    62     59     68   113   144   104     66     73;
    63     58     71   122   154   106     70     69;
    67     61     68   104   126     88     68     70;
    79     65     60     70     77     68     58     75;
    85     71     64     59     55     61     65     83;
    87     79     69     68     65     76     78     94];
X_ori=X;
X = X - 128;
Y = dct2(X);
Y_r = round(Y);
LumTable = [16    11    10    16    24    40    51    61;
    12    12    14    19    26    58    60    55;
    14    13    16    24    40    57    69    56;
    14    17    22    29    51    87    80    62;
    18    22    37    56    68  109  103    77;
    24    35    55    64    81  104  113    92;
    49    64    78    87  103  121  120  101;
    72    92    95    98  112  100  103    99 ;];
YQ = Y ./ LumTable;
YQ_r = round(YQ);

% YQ2 = Y ./ LumTable ./ 2;
% YQ_r2 = round(YQ2);

YQ_r_rec = YQ_r .* LumTable; % + round(LumTable/2).* double(abs(YQ_r)>0);
X_rec = idct2(YQ_r_rec);
X_rec = round(X_rec);
X_rec = X_rec + 128;

Error = X_ori - X_rec;
MSE = sum(sum(Error.*Error))/64;
MAE = sum(sum(abs(Error)))/64;

