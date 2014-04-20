% function [out_param] = get_data()
% function to do something usefull (fill out)
% Usage [out_param] = get_data(in_param)
% Input Parameter:
%	 in_param: 		 Explain the parameter, default values, and units
% Output Parameter:
%	 out_param: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: S.Herrmann, J.Klug (c) TGM @ Jade Hochschule applied licence see 
% EOF 
% Version History:
% Ver. 0.01 initial create     14-Apr-2014  Initials (SH,JK)

%------------Your function implementation here--------------------------- 

% Herunterladen der Wetterdaten aus dem Internet
url_path = urlwrite ('http://api.met.no/weatherapi/locationforecast/1.8/?lat=53.143889;lon=8.213889','data.xml');

% Einlesen der xml - Datei als Java Object
content_java = xmlread('data.xml');

% Aufruf der Funktion "parse_xml" zur Umwandlung des Java Objektes in eine 
% Matlab-Struktur
content_st = parse_xml(content_java);

name = content_st.children{1,1}.name;

date = content_st.children{1}.children{1}.children{1,1}.attributes.from(1:10);

temp = cell(1,3);

counter = 1;

for kk = 1:length(content_st.children{1}.children{2}.children)
    if strcmp(content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.name,'temperature');
    temp(counter,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
    temp(counter,2) = {content_st.children{1}.children{2}.children{kk}.attributes.to};
    temp(counter,3) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.attributes.value};
    counter = counter + 1;
    end
end   

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