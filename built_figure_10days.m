function [] = built_figure_10days(temp,cloud,prec)
% function to show weatherforecast of next 10 days
% Usage [out_param] = built_figure_10days(temp,cloud,prec)
%       temp:  cell-array with the minimal and maximal temperature for the
%              next ten days
%       cloud: cell-array with the mean cloudyness for the next ten days
%       prec:  cell-array with the mean precipitation for the next ten days	
%------------------------------------------------------------------------ 

% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied 
% licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 28-Apr-2014  Initials (SH JK MN)
% Ver. 1.0                         02-Mai-2014  Initials (SH JK MN)

%suchen der figure
findobj('tag','white_figure');

%setzt das Koordinatensystem an den linken, unteren Rand
set(gca,'position',[0 0 1 1]);   

%Plotten der Hintergrundlinien
plot([0.01 0.99],[0.80 0.80],'k:','tag','rebase');
hold on;
for kk = .1:.1:.9
plot([kk kk],[0.05 0.901],'k:','tag','rebase');
hold on;
end
axis off; 

% Tag 1 bis 5 werden in einer Schleife in die figure geladen
position_counter = 0.002;

for kk = 1:10
 % Wochentag
[num,name] = weekday(temp{kk,1},'local','long');
h_text1 = uicontrol('style','text');
set(h_text1,'units','normalized','position',[position_counter 0.81 0.085 0.05],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Comic Sans MS','FontSize',11,'string',name);

%Thermometerbild, abh�ngig von der Maximaltemperatur
setthermobild(temp{kk,3},[position_counter+0.01 0.63 0.02 0.1]); 

% Maximaltemperatur in Grad
h_text2 = uicontrol('style','text');
set(h_text2,'units','normalized','position',[position_counter+0.04 0.68 0.04 0.03],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Arial','FontSize',12,'ForegroundColor',[1 0 0],...
   'string',[num2str(temp{kk,3}) '�']);

% Minimaltemperarur in Grad
value2 = num2str(temp{kk,2});
value2 = [value2,'�'];
h_text3 = uicontrol('style','text');
set(h_text3,'units','normalized','position',[position_counter+0.04 0.64 0.04 0.03],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Arial','FontSize',12,'ForegroundColor',[0 1 0],...
   'string',value2);

% Wolkenbild, abh�ngig von der St�rke der Bew�lkung
value3 = round(cloud{kk,1});
[Text,font_color]= setthermobild(value3,[position_counter+0.01 0.38 0.06 0.2],'cloud'); 

% Bew�lkungsgrad in Prozent
value3 = num2str(value3);
value3 = [value3,'%'];
h_text4 = uicontrol('style','text');
set(h_text4,'units','normalized','position',[position_counter+0.015 0.34 0.06 0.05],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Arial','FontSize',15,'ForegroundColor',font_color,...
   'string',value3);

% Niederschlagsbild, abh�ngig von der Niederschlagsmenge
if kk< 4
    value4 = (round(prec{kk,2}*100))/100;
else
    value4 = (round(prec{kk,2}*50))/100;
end
setthermobild(value4,[position_counter+0.01 0.12 0.06 0.2],'rain',3);

% Niederschlagswert in mm
h_text5 = uicontrol('style','text');
set(h_text5,'units','normalized','position',[position_counter+0.01 0.07 0.07 0.06],...
   'BackgroundColor',[1 1 1],'tag','rebase',...
   'FontName','Arial','FontSize',10,'ForegroundColor',[0.1 0 1],...
   'string',[num2str(value4) 'mm/3h']);

position_counter = position_counter + 0.1;
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