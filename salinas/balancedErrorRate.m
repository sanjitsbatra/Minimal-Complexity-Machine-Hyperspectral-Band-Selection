function ber = balancedErrorRate(trueY, predictedY, ranking) 
% Compute the balanced error rate (BER), assuming binary (-1, +1) labels 
%
% Usage: ber = balancedErrorRate(trueY, predictedY, ranking) 
% Inputs/Outputs: 
%   trueY - a column vector of binary labels 
%   predictedY - a column vector of predicted labels 
%   rankings (optional) - rankings of predicted labels 
%
%   ber - the balanced error rate
%
% Copyright (C) 2006 Charanpal Dhanjal 

% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
% 
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Lesser General Public
% License along with this library; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
% USA

if (nargin < 2)
    fprintf('%s\n', help(sprintf('%s', mfilename)));
    error('Incorrect number of inputs - see above usage instructions.');
end

[numExamples, numLabels] = size(trueY);

if numLabels > 1 
    error('balancedErrorRate only works with single labels'); 
end

a = sum((trueY == -1) & (predictedY == -1), 1);
b = sum((trueY == -1) & (predictedY == 1), 1);
c = sum((trueY == 1) & (predictedY == -1), 1);
d = sum((trueY == 1) & (predictedY == 1), 1);

ber = 0.5*(b/(a+b+((a+b)==0)) + c/(c+d+((c+d)==0))); 