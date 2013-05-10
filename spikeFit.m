%spikeFit creates two linear regressions for a set of data points - the Twitter hashtag mentions that we dealt with

function [lin poly resid t] = spikefit(hourdata, baseline)
%hourdata is a column of consecutive data points
%baseline is the observed tweet baseline

%lin model (coefficients in lin including)
% y = B2*exp(B1*t) + B3 (baseline)

%poly model (coefficients in poly including)
% y = B4*exp(B3*t + B2*t^2 + B1*t^3) + B5 (baseline)


%time array
[row column] = size(hourdata);
t = 1:row;
t = transpose(t);

%Baseline adjustment and log transformation
datafix = hourdata - baseline;
datalog = log(datafix);

%linear fit log y = log B0 + B1*t
linreg = polyfit(t, datalog, 1);
linfit = polyval(linreg, t);

%poly fit (n=3) log y = log B0 + B1*t + B2*t^2 + B3*t^3
polyreg = polyfit(t, datalog, 3);
polyfit = polyval(polyreg, t);

%solve for original B0
linregfix = linreg;
linregfix(2) = exp(linreg(2));
polyregfix = polyreg;
polyregfix(4) = exp(polyreg(4));

%residual values, squared sum of residual and R^2
SStotal = (length(datalog)-1) * var(datalog);
linresid = datalog - linfit;
linSS = sum(linresid.^2);
linrsq = 1 - linSS/SStotal;
polyresid = datalog - polyfit;
polySS = sum(polyresid.^2);
polyrsq = 1 - polySS/SStotal;

%return error (SSR and R^2)
resid = ones(2,2);
resid(1,1) = linSS;
resid(2,1) = linrsq;
resid(1,2) = polySS;
resid(2,2) = polyrsq;

%return parameters
lin(1:2) = linregfix(1:2);
lin(3) = baseline;
poly(1:4) = polyregfix(1:4);
poly(5) = baseline;
