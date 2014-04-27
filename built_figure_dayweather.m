function [] = built_figure_dayweather(temp,cloud,prec,weatherdata24)
% function to built a figure and show dayweather
% Usage [] = built_figure_dayweather(weatherdata24)
% Input Parameter:
%       weatherdata24:  cell-array with 24 rows containing in 4 columns time,
%                       temperature, cloudiness ,precipitation
%------------------------------------------------------------------------ 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2014  Initials (SH JK MN)

Stunden = length(weatherdata24); % oder 24
Uhrzeit = num2str(cell2mat(weatherdata24(1:end,1)));
Temperatur = num2str(cell2mat(weatherdata24(1:end,2)));
Wolken = cell2mat(weatherdata24(1:end,3));
Niederschlag = num2str(cell2mat(weatherdata24(1:end,4)));

% figure setting
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

for kk = 1:Stunden
        yPosition = (.9-kk*(0.8/Stunden));
        hohe = 0.8/Stunden;
    h_text1 = uicontrol('style','text');
    set(h_text1,'units','normalized','position',  [0.1 yPosition 0.1 hohe]...
        ,'BackgroundColor',[1 1 1],...
       'FontName','Comic Sans MS','FontSize',12,'string',[Uhrzeit(kk,1) ':00']);
    h_text2 = uicontrol('style','text');
    set(h_text2,'units','normalized','position',...
       [.4 yPosition 0.1 hohe],'BackgroundColor',[1 1 1],...
       'FontName','Comic Sans MS','FontSize',12,'string',[Temperatur(kk,1:end) '°']);
    h_text3 = uicontrol('style','text');
    set(h_text3,'units','normalized','position',...
       [.5 yPosition 0.1 hohe],'BackgroundColor',[1 1 1],...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Wolken(kk,1:end)) ' %']);

    % Bildauswahl fuer Wolken
        if Wolken(kk,:) >= 0 && Wolken(kk) < 25
           wolke = imread('wolke1.jpg');
           font_color = [1 0.8 0];
        elseif Wolken(kk) >= 25 && Wolken(kk) < 50
           wolke = imread('wolke2.jpg');
           font_color = [1 0.35 0];
        elseif Wolken(kk) >= 50 && Wolken(kk) < 75
           wolke = imread('wolke3.jpg');
           font_color = [0 0.5 1];
        elseif Wolken(kk) >= 75 && Wolken(kk) <= 100
           wolke = imread('wolke4.jpg');
           font_color = [0 0 1];
        end
        axes('Position', [.2 yPosition hohe hohe]); 
        image(wolke);
        axis image;
        axis off;


    h_text4 = uicontrol('style','text');
    set(h_text4,'units','normalized','position',...
       [.6 yPosition 0.1 hohe],'BackgroundColor',[1 1 1],...
       'FontName','Comic Sans MS','FontSize',12,'string',[Niederschlag(kk,1:end) ' mm']);
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