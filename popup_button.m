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
% Ver. 1.00 initial create          27-Apr-2014        Initials (SH JK MN)

% lie�t die entsprechende Position des ausgew�hlten Men�punktes des
% popup-Buttons aus  
position = get(handle, 'value');
close all;
% Zuordnung der Auswahl zu der entsprechenden Funktion
if position == 1
        % Tagesansicht
        built_figure_dayweather(temp,cloud,prec,weatherdata24)  
elseif position == 2
        % 10 Tagesansicht
        disp('Diese Funktion in noch nicht verf�gbar...')
elseif position == 3
       % 5 Tagesansicht
       built_figure(temp,cloud,prec,weatherdata24)
end
%blablabla
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