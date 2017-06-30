function dataM = genCovData(covM, m)
% Keywords: covariance, random data, noisy data
%
% Purpose : generate a data set with m random data vectors with a
%           exactly the predefined covariance matrix 'covM';
%
% Syntax : dataM = genCovData(covM, m)
%
% Input Parameters :
%           covM := covariancematrix of the output; a squared symmetric
%           positiv semi-definit matrix; dimension d of the matrix is the
%           dimension of the random data vector
%
%           m := number of realisations of random data vector;
%           
%
% Return Parameters :
%           dataM := a matrix of size [dxm], where each column is a
%           realisation of the random variable; the covariance (cov(dataM')
%           is the given covM;
%
% Description :
%   using code from:
%       https://stats.stackexchange.com/questions/120179/generating-data-with-a-given-sample-covariance-matrix
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

%% Check input arguments
[r,c] = size(covM);
if r~=c
    error('The input argument covM has to be a square matrix');
end

%% generate the data set
X = randn(m,r);
X = bsxfun(@minus, X, mean(X));
X =X /(chol(cov(X)));
X = X * chol(covM);
dataM = X';