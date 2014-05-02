function [Bewolkung,FontColor] = setthermobild(value1,xPosyPosxRangeyRange,varargin)
% Usage [] = setthermobild(value1,xPos,yPos,xRange,yRange)
%           Plot Thermometerbild, abhängig von der Temperatur
% Usage [] = setthermobild(value1,xPos,yPos,xRange,yRange,'rain')
%           Plot Niederschlagsbild, abhängig vom Niederschlagswert
% Usage [Bewolkung,FontColor] = setthermobild(value1,xPos,yPos,xRange,yRange,'cloud')
%           Plot Wolkenbild, abhängig von Wert
% Usage [Bewolkung,FontColor] = setthermobild(value1,xPos,yPos,xRange,yRange,'cloud',time)
%           Plot Wolkenbild, abhängig von Wert und Tageszeit
% Input Parameter:
%	value1:
%   xPosyPosxRangeyRange:   Positions und Groessen Parameter
%   time:                   Stundenwert
% Output Parameter:
%   Bewolkung:  String wie 'Bewoeltkt oder 'klar'
%------------------------------------------------------------------------ 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 02-May-2014  Initials (SH JK MN)
if nargin == 2
    
        if value1 <= 0
           Wetterbild = imread('thermometer1.jpg');
        elseif value1 > 0 && value1 < 10
           Wetterbild = imread('thermometer2.jpg');
        elseif value1 >= 10 && value1 < 15
           Wetterbild = imread('thermometer3.jpg');
        elseif value1 >= 15 && value1 < 20
           Wetterbild = imread('thermometer4.jpg');
        elseif value1 >= 20 && value1 < 30
           Wetterbild = imread('thermometer5.jpg');
        elseif value1 > 30
           Wetterbild = imread('thermometer6.jpg');
        end
 
elseif nargin == 3 && strcmp(varargin{1},'rain')
   
    % Niederschlagsbild, abhängig von der Niederschlagsmenge
        if value1 == 0 
            Wetterbild = imread('rain1.jpg');
        elseif value1 < 0.2 &&  value1 > 0
           Wetterbild = imread('rain2.jpg');
        elseif value1 < 0.4 &&  value1 > 0.2
           Wetterbild = imread('rain3.jpg'); 
        elseif value1 < 0.6 &&  value1 > 0.4
            Wetterbild = imread('rain4.jpg'); 
        else
            Wetterbild = imread('rain5.jpg'); 
        end
        
elseif nargin >= 3 && strcmp(varargin{1},'cloud')        
        
        if nargin == 3 && (varargin{2} <= 6 || varargin{2} >= 23)
        filename = 'mond';
        else
        filename = 'wolke';
        end
        
        if value1 >= 0 && value1 < 25
           Wetterbild = imread([filename  '1.jpg']);
           FontColor = [0 0.75 1];
           Bewolkung = 'Klar';
        elseif value1 >= 25 && value1 < 50
           Wetterbild = imread([filename  '2.jpg']);
           FontColor = [0 0.5 1];
           Bewolkung = 'Meist klar';
        elseif value1 >= 50 && value1 < 75
           Wetterbild = imread([filename  '3.jpg']);
           FontColor = [0 0.25 1];
           Bewolkung = 'Teilweise Bewölkt';
        elseif value1 >= 75 && value1 <= 100
           Wetterbild = imread('wolke4.jpg');
           FontColor = [0 0 1];
           Bewolkung = 'Bewölkt';
        end
else 
end
axes('tag','rebase','Position',xPosyPosxRangeyRange);
image(Wetterbild,'tag','rebase');
axis image;
axis off;

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