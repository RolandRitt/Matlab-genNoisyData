# Matlab-genNoisyData
function to generate a dataset with m realisations of a random d-dimensional variable with given covariance matrix
```
  % keywords: covariance, random data, noisy data
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
```
