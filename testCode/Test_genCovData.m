%% Test the functionality of genCovData
% 
% Description : 
%
% Author : 
%    Roland Ritt
%
% History :
% \change{1.0}{29-Jun-2017}{Original}
%
% --------------------------------------------------
% (c) 2017, Roland Ritt
% Chair of Automation, University of Leoben, Austria
% email: automation@unileoben.ac.at
% url: automation.unileoben.ac.at
% --------------------------------------------------
%
%%

clc;
clear all;
close all hidden;
n = 100; %n data points
m = 10000; % number of tests
noBfs=10-1;
x = linspace(-1,1,n)';
y0 = x.^2*0.3 + x*1 - x.^3*3;
y0=y0.*20;
noiseGain = 2;

%% Determine covarianceMatrix
 covData = diag(1:n);
 covData = eye(n)+diag(randn(1,n)*0.1);
   covData(3,10) = -5;
   covData(10,3) = -5;
% 
%     covData(3,7) = 1;
%   covData(7,3) = 1;
% 
 covData(15,25) = +8;
 covData(25,15) = +8;

covData = covData'*covData;


%% generate data sets

data1 = genCovData(covData, m);
data2 = genCovData(covData, m);
% data1 = genCovData(covData, m);
% data2 = genCovData(covData, m, y0);
data3 = mvnrnd(ones(m,n), covData);
data3 = data3';
%% calc cov of data

covData1 = cov(data1');
covData2= cov(data2');
covData3 = cov(data3');
%% check cov data

diff1 = covData - covData1;
diff2 = covData -covData2;

if(max(max(abs(diff1)))>eps*300)
    error('test 1 went wrong');
end

if(max(max(abs(diff2)))>eps*300)
    error('test 2 went wrong');
end

if diff1(3,10)  >=eps*100
    error('cov Element 1 wrong');
end

if diff1(10,3) >=eps*10
    error('cov Element 2 wrong');
end

if diff1(15,25)  >=eps*100
    error('cov Element 3 wrong');
end

if diff1(25,15) >=eps*100
    error('cov Element 4 wrong');
end

%% Test cov with curve
Y0 = repmat(y0,1,m);
data4 = Y0 + data1;
covData4 = cov(data4');
diff4 = covData - covData4;

if(max(max(abs(diff4)))>eps*200)
    error('test 4 went wrong');
end

data5 = genCovData(covData,m,y0);
covData5 = cov(data5');
diff5 = covData -covData5;

if(max(max(abs(diff5)))>eps*200)
    error('test 4 went wrong');
end
%% plot data
figureGen;
plot(y0);
hold on;
grid on;
plot(covData2(:,5));
figureGen;
plot(data2(:,1:30))

figureGen;
plot(data1(:,1:30))


%%

figureGen;
plot(y0);
hold on;
grid on;
plot(covData4(:,5));
figureGen;
plot(data4(:,1))

figureGen;
plot(data4(:,1:30));
title('Noisy dataset with given covariance matrix');
grid on;
hold on;