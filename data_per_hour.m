function [dataPerh] = data_per_hour(time,temp,clouds,rain)
% function to extract next 24 hour datas from weatherinfo
% Usage [dataPerh] = data_per_hour(time,temp,clouds,rain)
% Input Parameter:
%	time: 		Explain the parameter, default values, and units
%   temp: 
%   clouds:
%   rain:
% Output Parameter:
%	 dataPerh: 	cell-array with 24 rows containing in 4 columns time,
%               temperature, cloudiness ,precipitation
%------------------------------------------------------------------------ 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 26-Apr-2014  Initials (SH JK MN)

dataPerh = cell(24,4);
hour_time = regexp(time(2:25),'T(\d*):', 'tokens', 'once');

for kk = 1:24
    dataPerh{kk,1} = str2double(hour_time{kk});
    dataPerh{kk,2} = str2double(temp{kk+1});
    dataPerh{kk,3} = str2double(clouds{kk+1});
    dataPerh{kk,4} = str2double(rain{((kk-1)*4)+9});
end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> S.Herrmann, J.Klug, M.Nienaber
% Jade University of Applied Sciences 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.