function [] = built_figure_dayweather(temp,cloud,prec,weatherdata24)
% function to built a figure and show dayweather
% Usage [] = built_figure_dayweather(weatherdata24)
% Input Parameter:
%       temp:  cell-array with the minimal and maximal temperature for the
%              next ten days
%       cloud: cell-array with the mean cloudyness for the next ten days
%       prec:  cell-array with the mean precipitation for the next ten days	
%       weatherdata24:  cell-array with 24 rows containing in 4 columns time,
%                       temperature, cloudiness ,precipitation
%------------------------------------------------------------------------ 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2014  Initials (SH JK MN)

Stunden = length(weatherdata24); % oder 24
hohe = 0.8/Stunden;
Uhrzeit = cell2mat(weatherdata24(1:end,1));
Temperatur = cell2mat(weatherdata24(1:end,2));
Wolken = cell2mat(weatherdata24(1:end,3));
Niederschlag = cell2mat(weatherdata24(1:end,4));

findobj('tag','white_figure');

for kk = 1:Stunden
    
    yPosition = (.9-kk*(0.8/Stunden));
    
    h_text1 = uicontrol('style','text');
    set(h_text1,'units','normalized','position',  [0.4 yPosition 0.05 hohe]...
        ,'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','center',...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Uhrzeit(kk,:)) ':00']);
    
           
%     h_text2 = uicontrol('style','text');
%     set(h_text2,'units','normalized','position', [.6 yPosition 0.1 hohe],...
%        'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
%        'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Wolken(kk,:)) ' %']);

    % Bildauswahl fuer Wolken
        if Uhrzeit(kk,:) <= 6 || Uhrzeit(kk,:) >= 23
        filename = 'mond';
        else
        filename = 'wolke';
        end
        if Wolken(kk,:) >= 0 && Wolken(kk) < 25
           wolke = imread([filename  '1.jpg']);
           font_color = [0 0.75 1];
           text = 'Klar';
        elseif Wolken(kk) >= 25 && Wolken(kk) < 50
           wolke = imread([filename  '2.jpg']);
           font_color = [0 0.5 1];
           text = 'Meist klar';
        elseif Wolken(kk) >= 50 && Wolken(kk) < 75
           wolke = imread([filename  '3.jpg']);
           font_color = [0 0.25 1];
           text = 'Teilweise Bewölkt';
        elseif Wolken(kk) >= 75 && Wolken(kk) <= 100
           wolke = imread('wolke4.jpg');
           font_color = [0 0 1];
           text = 'Bewölkt';
        end
        axes('tag','rebase','Position', [.5 yPosition hohe hohe]); 
        image(wolke,'tag','rebase');
        axis image;
        axis off;

    h_text3 = uicontrol('style','text');
    set(h_text3,'units','normalized','position',[.6 yPosition 0.05 hohe]...
        ,'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Temperatur(kk,:)) '°']);    
        
        
        
        
    h_text4 = uicontrol('style','text');
    set(h_text4,'units','normalized','position',[.7 yPosition 0.1 hohe],...
       'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','left',...
       'FontName','Comic Sans MS','FontSize',12,'ForegroundColor',font_color,'string',text);    
    
    % Niederschlagsbild, abhängig von der Niederschlagsmenge
        
        if Niederschlag(kk,:) == 0 
            niederschlag = [];
        elseif Niederschlag(kk,:) < 0.2 &&  Niederschlag(kk,:) > 0
           niederschlag = imread('rain2.jpg');
        elseif Niederschlag(kk,:) < 0.4 &&  Niederschlag(kk,:) > 0.2
           niederschlag = imread('rain3.jpg'); 
        elseif Niederschlag(kk,:) < 0.6 &&  Niederschlag(kk,:) > 0.4
            niederschlag = imread('rain4.jpg'); 
        else
            niederschlag = imread('rain5.jpg'); 
        end
        axes('tag','rebase','Position', [.85 yPosition hohe hohe]); 
        image(niederschlag,'tag','rebase');
        axis image;
        axis off;
   
      h_text5 = uicontrol('style','text');
    set(h_text5,'units','normalized','position',[.9 yPosition 0.07 hohe],...
        'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Niederschlag(kk,:)) ' mm']);  
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