% function [temp_min_max, cloud_mean, prec_mean] = get_data()
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

% Auslesen des Abrufdatums
date = content_st.children{1}.children{1}.children{1,1}.attributes.from(1:10);

% Erstellen von cell-arrays, in denen die entsprechenden Daten gespeichert
% werden. Zudem werden zwei counter erstellt
temp = cell(1,3);
cloud = cell(1,3);
prec = cell(1,3);

counter1 = 1;
counter2 = 1;

% Zählschleife, in der die Temperatur, die Bewölkung und der Niederschlag
% aus der Struktur content_st herausgesucht werden in den dazugehörigen
% cell-arrays (temp, cloud, prec) gespeichert werden. 
for kk = 1:length(content_st.children{1}.children{2}.children)
    
    if strcmp(content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.name,'temperature');
        
        temp(counter1,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
        temp(counter1,2) = {content_st.children{1}.children{2}.children{kk}.attributes.to};
        temp(counter1,3) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.attributes.value};

        cloud (counter1,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
        cloud (counter1,2) = {content_st.children{1}.children{2}.children{kk}.attributes.to};
        cloud (counter1,3) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{6}.attributes.percent};

        counter1 = counter1 + 1;
    end
    
    if strcmp(content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.name,'precipitation');
        
        prec(counter2,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
        prec(counter2,2) = {content_st.children{1}.children{2}.children{kk}.attributes.to};
        prec(counter2,3) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.attributes.value};
        
        counter2 = counter2 + 1;
    end
end   

% Heraussuchen aller Daten (Plural von Datum!)aus dem Temperatur cell-array 
datum_full1 = regexp(temp,'[0-9]+-[0-9]+-[0-9]+','match');

% Erstellen eines neuen cell-arrays, in den die herausgesuchten Daten 
% geschrieben werden können. 
datum = cell(1);

% Umschreiben der Daten. Dies ist notwendig, da der Befehl "regexp" alle 
% gesuchten Daten (chars)in einen zusätzlichen 1x1 cell-array schreibt. 
% Dieser wird hier entfernt
for kk = 1:length(datum_full1)
    datum(kk) = datum_full1{kk};
end

% Alle doppelten Daten werden hier entfernt
datum = unique(datum);

% Schleife, die alle einstelligen Temperatur-/Bewölkungswerte mit einer 
% Null ergänzt. Dies ist notwendig, um die im cell-array gespeicherten 
% Daten später in eine Matrix wandeln zu können (cell2mat)
for kk = 1:length(temp(:,3))
    if length(temp{kk,3}) == 3
       temp{kk,3} = [temp{kk,3},'0'];
    end
    if length(cloud{kk,3}) == 4
       cloud{kk,3} = [cloud{kk,3},'0']; 
    end
    if length(cloud{kk,3}) == 3
       cloud{kk,3} = [cloud{kk,3},'00']; 
    end
end

% Erstellen eines neuen cell-arrays, in den die Minimal-, die 
% Maximaltemperatur und das Datum der nächsten 10 Tage gespeichert werden 
temp_min_max = cell(length(datum),3);

% Erstellen eines neuen cell-arrays, in den der mittlere Bewölkungswert und
% das Datum der nächsten 10 Tage gespeichert wird
cloud_mean = cell(length(datum),2);

% Schleife, in der die Temperatur-/ Bewölkungsdaten von jedem Datum  
% herausgesucht werden. Anschließend werden diese in eine Matrix und von 
% dort aus in Zahlen gewandelt. Von jedem Tag wird dann die Minimal-/
% Maximaltemperatur und der mittlere Bewölkungswert bestimmt und zusammen
% mit dem entsprechendem Datum gespeichert.
for kk = 1:length(datum)
    
    row1 = ~cellfun(@isempty, regexp(temp(:,1), datum(kk)));
    row2 = find(row1 == 1);
    
    temp_all1 = cell2mat(temp(row2,3)); 
    temp_all2 = str2num(temp_all1);
    cloud_all1 = cell2mat(cloud(row2,3));
    cloud_all2 = str2num(cloud_all1);
    
    temp_min = min(temp_all2);
    temp_max = max(temp_all2);
    cloud_mean_day = mean(cloud_all2); 
    
    temp_min_max{kk,1} = datum{kk}; 
    temp_min_max{kk,2} = temp_min;
    temp_min_max{kk,3} = temp_max;
    cloud_mean{kk,1} = datum{kk};
    cloud_mean{kk,2} = cloud_mean_day;
    
end

% Erstellen eines neuen cell-arrays, in den der mittlere Niederschlagswert
% und das Datum der nächsten 10 Tage gespeichert wird 
prec_mean = cell(length(datum),2);

% Schleife, in der alle Niederschlagswerte pro Tag herausgesucht werden.
% Anschließend werden diese in eine Matrix und von dort aus in Zahlen 
% umgewandelt. Zum Schluss wird pro Tag der Mittelwert gebildet und
% zusammen mit dem entsprechendem Datum in dem cell-array gespeichert.
% Anmerkung: da die Niederschlagswerte nicht stündlich -wie Temperatur und
% Bewökung- vorliegen, sondern in unterschiedlichen Intervallen, ist die
% Datenmenge entsprechend größer. Daher werden für die Zuordnung zu den
% jeweiligen Tagen andere Zeilenangaben benötigt. Um die Übersichtlichkeit
% zu wahren, findet dieser Arbeitsschritt in einer gesonderten 
% Schleife statt
for kk = 1:length(datum)
    
    row1 = ~cellfun(@isempty, regexp(prec(:,1), datum(kk)));
    row2 = find(row1 == 1);
    
    prec_all1 = cell2mat(prec(row2,3));
    prec_all2 = str2num(prec_all1);
    
    prec_mean_day = mean(prec_all2);
    
    prec_mean{kk,1} = datum{kk};
    prec_mean{kk,2} = prec_mean_day;

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