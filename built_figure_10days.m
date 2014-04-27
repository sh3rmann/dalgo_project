function [] = built_figure_10days(temp,cloud,prec,weatherdata24)
% function to do something usefull (fill out)
% Usage [out_param] = built_figure_10days(in_param)
% Input Parameter:
%	 in_param: 		 Explain the parameter, default values, and units
% Output Parameter:
%	 out_param: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 28-Apr-2014  Initials (SH JK MN)


figure_handle = figure();
set(figure_handle,'Name','Weatherdata from Oldenburg','NumberTitle',...
   'off','units','normalized','position',[0.1691 0.1302 0.6991 0.7985],...
   'ToolBar','none','MenuBar','none','Color',[1 1 1 ]);

set(gca,'position',[0 0 1 1]);    
axis off

h_button = uicontrol(figure_handle,'style','popupmenu','units',...
'normalized','string',{'Tagesansicht','10 Tagesansicht',...
'5 Tagesansicht'},'position',[0.13 0.92 0.3 0.05],'BackgroundColor',[1 1 0.5],...
'FontName','Comic Sans MS','FontSize',12,'callback',{@popup_button,temp,cloud,prec,weatherdata24});

h_text1 = uicontrol('style','text');
    set(h_text1,'units','normalized','position',  [0.5 0.5 0.2 0.2]...
        ,'BackgroundColor',[1 1 1],...
       'FontName','Comic Sans MS','FontSize',12,'string','Diese Funktion ist noch nicht verfügbar...');

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