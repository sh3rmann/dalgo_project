 function [] = built_figure(temp, cloud, prec, weatherdata24)
% function to built a figure to show weather forecast grafically
% Usage [] = built_figure(temp, cloud, prec, weatherdata24)
% Input Parameter:
%       temp:  cell-array with the minimal and maximal temperature for the
%              next ten days
%       cloud: cell-array with the mean cloudyness for the next ten days
%       prec:  cell-array with the mean precipitation for the next ten days	
%       weatherdata24:  cell-array with 24 rows containing in 4 columns time,
%                       temperature, cloudiness ,precipitation
%------------------------------------------------------------------------ 
%
% Author: S.Herrmann, J.Klug, M.Nienaber(c) TGM @ Jade Hochschule applied licence see
% EOF 
% Version History:
% Ver. 0.01                  21-Apr-2014                Initials (SH JK MN)
% Ver. 1.00                  21-Apr-2014                Initials (SH JK MN)

% Erstellen der figure 
figure_handle = figure();
set(figure_handle,'Name','Weatherdata from Oldenburg','NumberTitle',...
   'off','units','normalized','position',[0.1691 0.1302 0.6991 0.7985],...
   'ToolBar','none','MenuBar','none','Color',[1 1 1 ],'tag','white_figure');
set(gca,'position',[0 0 1 1]); 

% Erstellen des Buttons
h_button = uicontrol(figure_handle,'style','popupmenu');
set(h_button,'units','normalized','string',{'Tagesansicht',...
   '10 Tagesansicht','5 Tagesansicht'},'position',[0.13 0.92 0.3 0.05],...
   'BackgroundColor',[1 1 0.5],'FontName','Comic Sans MS','FontSize',12,...
   'callback',{@popup_button,temp,cloud,prec,weatherdata24});
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