clc
clear
%-----------function-----------
lambda = 1;
f = @(t,y) (-lambda) * y;
y0 = 1;
%--------------intervallo----------------
a=0; b=5;
options = odeset('Stats', 'on');
for lambda = [1 10 100]
    f = @(t,y) (-lambda) * y;
    fprintf(['\nODE23 Stats. Lambda = ' num2str(lambda) '\n']);
    [t_out y_out] = ode23(f, [a b], y0, options);
    figure('Name',['Comparison ODE23/ODE45. Lambda = ' num2str(lambda)]);
    plot(t_out, y_out);
    hold on

    fprintf(['\nODE45 Stats. Lambda = ' num2str(lambda) '\n']);
    [t_out y_out] = ode45(f, [a b], y0, options);
    plot(t_out, y_out);
    hold on

    legend('ODE23','ODE45')
end