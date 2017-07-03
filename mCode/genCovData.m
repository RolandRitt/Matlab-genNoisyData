function dataM = genCovData(covM, m, y0)
% Keywords: covariance, random data, noisy data
%
% Purpose : generate a data set with m random data vectors with a
%           exactly the predefined covariance matrix 'covM'; optional a
%           datavector can be given to generate a noisy data set for. In
%           this case the generated noise is added to y0
%
% Syntax :  dataM = genCovData(covM, m)
%           dataM = genCovData(covM, m, y0)
%
% Input Parameters :
%           covM := covariancematrix of the output; a squared symmetric
%           positiv semi-definit matrix; dimension d of the matrix is the
%           dimension of the random data vector
%
%           m := number of realisations of random data vector;
%
%           y0 := a column vector of size [dx1]; to this vector, the
%           generated noise with given covariance is added.
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
%       see also: mvnrnd
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

if nargin <3
    y0 = zeros(r,1);
end

[ry,cy] = size(y0);

if ry~= r || cy~=1
    error(['Input argument y0 must be of size [', num2str(c), 'x1]']);
end

%% generate the data set
X = randn(m,r);
X = bsxfun(@minus, X, mean(X));
X =X /(chol(cov(X)));
X = X * chol(covM);

X0 = repmat(y0, 1, m);

dataM = X0 + X';