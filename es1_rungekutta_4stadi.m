clc
%-----------function-----------
f = @(t, y) (-1)*y;
f_y0 = 1;

% intervallo
a=0; b=5;

figure('Name','Risoluzione metodo per PVI: Runge Kutta a 4 stadi');
% passo 0.1
h = 10^-1;
[x,y] = es( h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.01
h = 10^-2;
[x,y] = es( h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.001
h = 10^-3;
[x,y] = es( h, f, a, b, f_y0);
plot(x,y);
hold on

legend('h = 10^-1','h = 10^-2','h = 10^-3')

function [x,y] = es(h, f, a, b, y0)
    x = a+h:h:b; % punti di rete equispaziati
    num_iter = size(x,2);
    y = zeros(1,num_iter);
    y(1) = y0;
    for i=2:num_iter
        y(i) = runge_kutta_4stadi(f,(i-1)*h,y(i-1),h);
    end
end