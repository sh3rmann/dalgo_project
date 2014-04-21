% function [] = built_figure(temp, cloud, prec)
% function to built a figure and show weather forecast grafically
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

%%%%%%%%%%%%%%%%%%%%%%%%%% Erstellen der figure %%%%%%%%%%%%%%%%%%%%%%%%%%
figure_handle = figure();

set(figure_handle,'Name','Weatherdata from Oldenburg','NumberTitle','off');
set(figure_handle,'units','normalized');
set(figure_handle,'position',[0.1691 0.1302 0.6991 0.7122]);
set(figure_handle,'ToolBar','none');
set(figure_handle,'MenuBar','none');
set(figure_handle,'Color',[1 1 1 ]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Tag 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Datum
h1_text1 = uicontrol('style','text');
set(h1_text1,'units','normalized');
set(h1_text1,'position',[0.04 0.87 0.15 0.075]);
set(h1_text1,'BackgroundColor',[1 1 1]);
set(h1_text1,'FontName','Comic Sans MS');
set(h1_text1,'FontSize',20);
set(h1_text1,'string',temp{1,1});

% Bild Thermometer
thermo = imread('thermometer.jpg');
axes('Position', [0.04 0.65 0.03 0.15]); 
image(thermo);
axis image;
axis off;

% Maximaltemperatur in Grad
h1_text2 = uicontrol('style','text');
set(h1_text2,'units','normalized');
set(h1_text2,'position',[0.09 0.72 0.1 0.07]);
set(h1_text2,'BackgroundColor',[1 1 1]);
set(h1_text2,'FontName','Arial')
set(h1_text2,'FontSize',22);
set(h1_text2,'ForegroundColor',[1 0 0]);
h1_value1 = num2str(temp{1,3});
h1_value1 = [h1_value1,'°'];
set(h1_text2,'string',h1_value1);

% Minimaltemperarur in Grad
h1_text3 = uicontrol('style','text');
set(h1_text3,'units','normalized');
set(h1_text3,'position',[0.09 0.65 0.1 0.07]);
set(h1_text3,'BackgroundColor',[1 1 1]);
set(h1_text3,'FontName','Arial');
set(h1_text3,'FontSize',22);
set(h1_text3,'ForegroundColor',[0 1 0]);
h1_value2 = num2str(temp{1,2});
h1_value2 = [h1_value2,'°'];
set(h1_text3,'string',h1_value2);

% Wolkenbild, abhängig von der Stärke der Bewölkung
h1_value3 = round(cloud{1,2});
if h1_value3 >= 0 && h1_value3 < 25
   wolke = imread('wolke1.jpg');
   font_color = [1 0.8 0];
end
if h1_value3 >= 25 && h1_value3 < 50
   wolke = imread('wolke2.jpg');
   font_color = [1 0.35 0];
end
if h1_value3 >= 50 && h1_value3 < 75
   wolke = imread('wolke3.jpg');
   font_color = [0 0.5 1];
end
if h1_value3 >= 75 && h1_value3 <= 100
   wolke = imread('wolke4.jpg');
   font_color = [0 0 1];
end
axes('Position', [0.05 0.43 0.1 0.15]); 
image(wolke);
axis image;
axis off;

% Bewölkungsgrad in Prozent
h1_text4 = uicontrol('style','text');
set(h1_text4,'units','normalized');
set(h1_text4,'position',[0.05 0.35 0.1 0.065]);
set(h1_text4,'BackgroundColor',[1 1 1]);
set(h1_text4,'FontName','Arial');
set(h1_text4,'FontSize',22);
set(h1_text4,'ForegroundColor',font_color);
h1_value3 = num2str(h1_value3);
h1_value3 = [h1_value3,'%'];
set(h1_text4,'string',h1_value3);

% Niederschlagsbild
niederschlag = imread('niederschlag.jpg');
axes('Position', [0.05 0.13 0.1 0.15]); 
image(niederschlag);
axis image;
axis off;

% Niederschlagswert in mm
h1_value4 = (round(prec{1,2}*100))/100;
h1_text5 = uicontrol('style','text');
set(h1_text5,'units','normalized');
set(h1_text5,'position',[0.05 0.03 0.1 0.075]);
set(h1_text5,'BackgroundColor',[1 1 1]);
set(h1_text5,'FontName','Arial');
set(h1_text5,'FontSize',19);
set(h1_text5,'ForegroundColor',[0.1 0 1]);
h1_value4 = num2str(h1_value4);
h1_value4 = [h1_value4,'mm'];
set(h1_text5,'string',h1_value4);


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