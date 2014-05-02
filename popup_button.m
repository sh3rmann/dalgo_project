function [] = popup_button(handle,event,temp,cloud,prec,weatherdata24)
% function to do chance the view of the forecast
% Usage [out_param] = popup_button(temp,cloud,prec)
% Input Parameter:
%       handle: gives the handle from the popupmenue
%       temp, cloud, prec: transfer the forecast information the other
%                          views (functions)

% Author: S. Herrmann, J. Klug, M. Nienaber (c) TGM @ Jade Hochschule 
% applied licence see EOF 
% Version History:
% Ver. 0.01 initial create          27-Apr-2014        Initials (SH JK MN)
% Ver. 1.00 initial create          28-Apr-2014        Initials (SH JK MN)


% Löscht alle vorhandenen Objekte mit dem tag 'rebase' und alle
% Koordinatensysteme (Bilder)
% (Textfelder und Bilder)
rebase = findobj('tag','rebase');
delete(rebase);

% ließt die entsprechende Position des ausgewählten Menüpunktes des
% popup-Buttons aus  
position = get(handle, 'value');

% Zuordnung der Auswahl zu der entsprechenden Funktion

% 5 Tagesansicht
if position == 1
    
        built_figure_dayweather(weatherdata24)
                 
% Tagesansicht
elseif position == 2
    
        built_figure_5days(temp,cloud,prec,weatherdata24)
        
% 10 Tagesansicht
elseif position == 3
       
       built_figure_10days(temp,cloud,prec,weatherdata24)
end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> S. Herrmann, J. Klug, M. Nienaber
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