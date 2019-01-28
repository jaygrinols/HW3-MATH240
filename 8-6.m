A = [6 -1; 12 8; -5 4;];
B = [4 0;0.5 2;];
C = [2 -2; 3 1;];

isequal(A*B, matrixmult(A, B))
isequal(B*C, matrixmult(B,C))
isequal(C*B, matrixmult(C,B))
