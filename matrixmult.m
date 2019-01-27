function out = matrixmult(A, B)
[mA, nA] = size(A);
[mB, nB] = size(B);
if nA ~= mB
	error('Number of A columns != Number of B rows, matrices are incompatible.')
end
out = zeros(mA, nB);
for i = 1:size(out)(1)
	for j = 1:size(out)(2)
		val = 0;
		for k = 1:nA
			val = val + A(i, k)*B(k, j);
		end
		out(i, j) = val;
	end
end
end
