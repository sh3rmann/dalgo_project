 function [] = built_figure(temp, cloud, prec, weatherdata24)
% function to built a figure and show weather forecast grafically
% Usage [] = built_figure(temp, cloud, prec)
% Input Parameter:
%       temp:  cell-array with the minimal and maximal temperature for the
%              next ten days
%       cloud: cell-array with the mean cloudyness for the next ten days
%       prec:  cell-array with the mean precipitation for the next ten days	 
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
   'ToolBar','none','MenuBar','none','Color',[1 1 1 ]);

set(gca,'position',[0 0 1 1]);   
axis ([0 1 0 1]);
plot([0.05 0.95],[0.80 0.80],'k:');
hold on;
plot([0.2 0.2],[0.05 0.901],'k:');
hold on;
plot([0.4 0.4],[0.05 0.901],'k:');
hold on;
plot([0.6 0.6],[0.05 0.901],'k:');
hold on;
plot([0.8 0.8],[0.05 0.901],'k:');
axis off;

h_button = uicontrol(figure_handle,'style','popupmenu','units',...
'normalized','string',{'Tagesansicht','10 Tagesansicht',...
'5 Tagesansicht'},'position',[0.13 0.92 0.3 0.05],'BackgroundColor',[1 1 0.5],...
'FontName','Comic Sans MS','FontSize',12,'callback',{@popup_button,temp,cloud,prec,weatherdata24});

% Tag 1 bis 5 werden in einer Schleife in die figure geladen
position_counter = 0.02;

for kk = 1:5
% Wochentag
[num,name] = weekday(temp{kk,1},'local','long');
h_text1 = uicontrol('style','text');
set(h_text1,'units','normalized','position',...
   [position_counter 0.82 0.16 0.075],'BackgroundColor',[1 1 1],...
   'FontName','Comic Sans MS','FontSize',20,'string',name);

% Thermometerbild, anhängig von der Maximaltemperatur
value1 = temp{kk,3};
if value1 < 10
   thermo = imread('thermometer1.jpg');

elseif value1 >= 10 && value1 <= 20
   thermo = imread('thermometer2.jpg');

elseif value1 > 20
   thermo = imread('thermometer3.jpg');
end
axes('Position', [position_counter+0.02 0.62 0.03 0.15]); 
image(thermo);
axis image;
axis off;

% Maximaltemperatur in Grad
value1 = num2str(value1);
value1 = [value1,'°'];
h_text2 = uicontrol('style','text');
set(h_text2,'units','normalized','position',...
   [position_counter+0.07 0.69 0.1 0.07],'BackgroundColor',[1 1 1],...
   'FontName','Arial','FontSize',22,'ForegroundColor',[1 0 0],...
   'string',value1);

% Minimaltemperarur in Grad
value2 = num2str(temp{kk,2});
value2 = [value2,'°'];
h_text3 = uicontrol('style','text');
set(h_text3,'units','normalized','position',...
   [position_counter+0.07 0.62 0.1 0.07],'BackgroundColor',[1 1 1],...
   'FontName','Arial','FontSize',22,'ForegroundColor',[0 1 0],...
   'string',value2);

% Wolkenbild, abhängig von der Stärke der Bewölkung
value3 = round(cloud{kk,1});
if value3 >= 0 && value3 < 25
   wolke = imread('wolke1.jpg');
   font_color = [0 0.75 1];
   
elseif value3 >= 25 && value3 < 50
   wolke = imread('wolke2.jpg');
   font_color = [0 0.5 1];

elseif value3 >= 50 && value3 < 75
   wolke = imread('wolke3.jpg');
   font_color = [0 0.25 1];

elseif value3 >= 75 && value3 <= 100
   wolke = imread('wolke4.jpg');
   font_color = [0 0 1];
end
axes('Position', [position_counter+0.03 0.42 0.1 0.15]); 
image(wolke);
axis image;
axis off;

% Bewölkungsgrad in Prozent
value3 = num2str(value3);
value3 = [value3,'%'];
h_text4 = uicontrol('style','text');
set(h_text4,'units','normalized','position',...
   [position_counter+0.03 0.33 0.1 0.065],'BackgroundColor',[1 1 1],...
   'FontName','Arial','FontSize',22,'ForegroundColor',font_color,...
   'string',value3);

% Niederschlagsbild, abhängig von der Niederschlagsmenge
if kk >= 4
   value4 = value4/2;
end
value4 = (round(prec{kk,2}*100))/100;
if value4 < 1.5  
   niederschlag = imread('niederschlag1.jpg');
else
   niederschlag = imread('niederschlag2.jpg'); 
end
axes('Position', [position_counter+0.03 0.12 0.1 0.15]); 
image(niederschlag);
axis image;
axis off;

% Niederschlagswert in mm
value4 = num2str(value4);
value4 = [value4,'mm/3h'];
h_text5 = uicontrol('style','text');
set(h_text5,'units','normalized','position',...
   [position_counter 0.03 0.15 0.075],'BackgroundColor',[1 1 1],...
   'FontName','Arial','FontSize',17,'ForegroundColor',[0.1 0 1],...
   'string',value4);

position_counter = position_counter + 0.2;

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