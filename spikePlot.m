function spikeplot(lin, pol, hourdata, t)

%Place estimated parameters into linear and trinomial models
 lint = lin(2)*exp(lin(1)*t) + lin(3);
 polt = pol(4)*exp(pol(3)*t + pol(2)*t.^2 + pol(1)*t.^3) + pol(5);
 
%Plot all together
 plot(t, polt,'color','r');
 hold on;
 plot(t, lint,'color','g');
 plot(t, hourdata,'color','b','linestyle','--');
 hold off;