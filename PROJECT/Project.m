N = 100; n = 0:N - 1;
Ts = 0.0001;

p=heaviside(n*Ts) - heaviside(n*Ts - 20*Ts) + heaviside(n*Ts - 40*Ts)-heaviside(n*Ts - 60*Ts);
subplot(411)
plot(n,p)

subplot(412);
plot(n, cos(2000*pi*n*Ts));


x = p.*cos(2000*pi*n*Ts);
subplot(413)
plot(n,x);


subplot(414)
y = abs(x);
%plot(n,y);hold on

z1 = averager(15, y);

plot(u)
%plot(z1)
function y = averager(M,x)
b = (1/M)*ones(1, M);
y = filter(b, 1, x);
end
