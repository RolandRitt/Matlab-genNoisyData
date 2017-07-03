# Matlab-genNoisyData
function to generate a dataset with m realisations of a random d-dimensional variable with given covariance matrix
```Matlab
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
```
