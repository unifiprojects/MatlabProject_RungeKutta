function y_next = runge_kutta_4stadi(f, ti, yi, h)
% INPUT
% f:= funzione
% ti:= punto di rete precedente utilizzato
% yi:= punto della funzione approssimato precedentemente
% h:= passo
    K1 = f(ti, yi);
    K2 = f(ti + h/2, yi + h/2 * K1);
    K3 = f(ti + h/2, yi + h/2 * K2);
    K4 = f(ti + h, yi + h * K3);
    y_next = yi + h/6 * (K1 + 2*K2 + 2*K3 + K4);
    return;
end


