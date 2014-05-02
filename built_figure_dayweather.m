function [] = built_figure_dayweather(weatherdata24)
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
[Uhr23,index23Uhr] = max(Uhrzeit);
Hochsttemperatur = max(Temperatur(1:index23Uhr));
Lowesttemperatur = min(Temperatur(1:index23Uhr));

findobj('tag','white_figure');

[Wochennr,Wochentag] = weekday(date,'local','long');

h_text3 = uicontrol('style','text');
set(h_text3,'units','normalized','position',[0.12, 0.62, 0.2, 0.1],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Comic Sans MS','FontSize',30,'string',Wochentag);

Today = clock;

h_text3 = uicontrol('style','text');
set(h_text3,'units','normalized','position',[0.12, 0.73, 0.2, 0.1],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Comic Sans MS','FontSize',30,'string',[ num2str(Today(3)) '.' num2str(Today(2)) '.' num2str(Today(1))]);

setthermobild(Hochsttemperatur,0.1, 0.22, 0.1, 0.4);

h_text2 = uicontrol('style','text');
set(h_text2,'units','normalized','position',[0.2, 0.43, 0.12, 0.1],...
   'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
   'FontName','Arial','FontSize',38,'ForegroundColor',[1 0 0],...
   'string',[num2str(Hochsttemperatur) '°']);

h_text3 = uicontrol('style','text');
set(h_text3,'units','normalized','position',[0.2, 0.3, 0.12, 0.1],...
   'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
   'FontName','Arial','FontSize',38,'ForegroundColor',[0 1 0],...
   'string',[num2str(Lowesttemperatur) '°']);



for kk = 1:Stunden
    
    yPosition = (.9-kk*(0.8/Stunden));
    
    h_text1 = uicontrol('style','text');
    set(h_text1,'units','normalized','position',  [0.4 yPosition 0.05 hohe]...
        ,'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Uhrzeit(kk,:)) ':00']);
    
           
%     h_text2 = uicontrol('style','text');
%     set(h_text2,'units','normalized','position', [.6 yPosition 0.1 hohe],...
%        'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
%        'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Wolken(kk,:)) ' %']);

 % Bildauswahl fuer Wolken
    [text,font_color] = setthermobild(Wolken(kk),.51, yPosition, hohe, hohe,'cloud',Uhrzeit(kk,:));
         
    h_text3 = uicontrol('style','text');
    set(h_text3,'units','normalized','position',[.6 yPosition 0.05 hohe]...
        ,'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','right',...
       'FontName','Comic Sans MS','FontSize',12,'string',[num2str(Temperatur(kk,:)) '°']);    
  
    h_text4 = uicontrol('style','text');
    set(h_text4,'units','normalized','position',[.7 yPosition 0.13 hohe],...
       'BackgroundColor',[1 1 1],'tag','rebase','HorizontalAlignment','left',...
       'FontName','Comic Sans MS','FontSize',12,'ForegroundColor',font_color,'string',text);    
    
    % Niederschlagsbild, abhängig von der Niederschlagsmenge
        setthermobild(Niederschlag(kk,:),.85, yPosition, hohe, hohe,'rain');
   
      h_text5 = uicontrol('style','text');
    set(h_text5,'units','normalized','position',[.88 yPosition 0.07 hohe],...
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