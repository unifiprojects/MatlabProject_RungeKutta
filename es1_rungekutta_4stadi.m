clc
e = exp(1);
% intervallo
a=0; b=5;

%-----------function-----------
f_y0 = 1;
f = @(t, y) (-1)*y;

figure('Name','Runge Kutta a 4 stadi. Lambda = 1');
% passo 0.1
h = 10^-1;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.01
h = 10^-2;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.001
h = 10^-3;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

true_function = @(t) e.^(-t);
fplot(true_function, [a b]);

max(abs(y-true_function(x)))

legend('h = 10^-1','h = 10^-2','h = 10^-3', 'e^(-t)')

%-----------function-----------
f_y0 = 1;
f = @(t, y) (-10)*y;

figure('Name','Runge Kutta a 4 stadi. Lambda = 10');
% passo 0.1
h = 10^-1;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.01
h = 10^-2;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.001
h = 10^-3;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

true_function = @(t) e.^(-10*t);
fplot(true_function, [a b]);

max(abs(y-true_function(x)))

legend('h = 10^-1','h = 10^-2','h = 10^-3', 'e^(-t)')


%-----------function-----------
f_y0 = 1;
f = @(t, y) (-100)*y;

figure('Name','Runge Kutta a 4 stadi. Lambda = 100');
% passo 0.1
h = 10^-1;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.01
h = 10^-2;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.001
h = 10^-3;
[x,y] = es(h, f, a, b, f_y0);
plot(x,y);
hold on

true_function = @(t) e.^(-100*t);
fplot(true_function, [a b]);

max(abs(y-true_function(x)))

legend('h = 10^-1','h = 10^-2','h = 10^-3', 'valori esatti')


function [x,y] = es(h, f, a, b, y0)
    x = a+h:h:b; % punti di rete equispaziati
    num_iter = size(x,2);
    y = zeros(1,num_iter);
    y(1) = y0;
    for i=2:num_iter
        y(i) = runge_kutta_4stadi(f,(i-1)*h,y(i-1),h);
    end
end