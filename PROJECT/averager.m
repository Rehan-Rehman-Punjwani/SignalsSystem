function y = averager(M,x)
b = (1/M)*ones(1, M);
y = filter(b, 1, x);
end