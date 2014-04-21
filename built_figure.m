% function [out_param] = built_figure(temp, cloud, prec)
% function to do something usefull (fill out)
% Usage [out_param] = built_figure(in_param)
% Input Parameter:
%	 in_param: 		 Explain the parameter, default values, and units
% Output Parameter:
%	 out_param: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: S.Herrmann, J.Klug (c) TGM @ Jade Hochschule applied licence see
% EOF 
% Version History:
% Ver. 0.01 initial create                   21-Apr-2014   Initials (SH JK)

%------------Your function implementation here--------------------------- 

% [temp, cloud, prec] = get_data();

figure_handle = figure();

set(figure_handle,'Name','Weatherdata from Oldenburg','NumberTitle','off');
set(figure_handle,'units','normalized');
set(figure_handle,'position',[0.1691 0.1302 0.6991 0.7122]);
set(figure_handle,'ToolBar','none');
set(figure_handle,'MenuBar','none');
set(figure_handle,'Color',[1 1 1 ]);

h1 = subplot(1,5,1);
axis off;
h1_text = uicontrol('style','text');
set(h1_text,'units','normalized');
set(h1_text,'position',[0.04 0.87 0.15 0.075]);
set(h1_text,'BackgroundColor',[1 1 1]);
set(h1_text,'FontName','Comic Sans MS')
set(h1_text,'FontSize',20);
set(h1_text,'string',temp{1,1});

thermo = imread('thermometer.jpg');
axes('Position', [0.04 0.7 0.03 0.13]); 
image(thermo);
axis image;
axis off;

% x = figure(2);
% set(x,'units','normalized');

%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> S.Herrmann, J.Klug
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