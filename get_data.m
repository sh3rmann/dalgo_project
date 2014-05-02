function [temp_min_max, cloud_mean, prec_mean,weather24hdata] = get_data()
% function to load the weather informations from the internet
% Usage [temp_min_max, cloud_mean, prec_mean] = get_data()
% Output Parameter:
%      temp_min_max:   cell-array with the date the minimal and maximal 
%                      temperature
%                      for the next ten days
%      cloud_mean:     cell-array with the mean cloudyness for the next ten
%                      days
%      prec_mean:      cell-array with the mean precipitation for the next
%                      ten days
%      weatherdata24:  cell-array with 24 rows containing in 4 columns time,
%                      temperature, cloudiness ,precipitation
%------------------------------------------------------------------------ 
% Author: S.Herrmann, J.Klug, M.Nienaber (c) TGM @ Jade Hochschule applied 
% licence see 
% EOF 
% Version History:
% Ver. 0.01                  14-Apr-2014                Initials (SH,JK,MN)
% Ver. 1.0                   20-Apr-2014                Initials (SH,JK,MN)

% Herunterladen der Wetterdaten aus dem Internet
urlwrite ('http://api.met.no/weatherapi/locationforecast/1.8/?lat=53.143889;lon=8.213889','data.xml'); 

% Einlesen der xml - Datei als Java Object
content_java = xmlread('data.xml');

% Aufruf der Funktion "parse_xml" zur Umwandlung des Java Objektes in eine 
% Matlab-Struktur
content_st = parse_xml(content_java);

% Erstellen von cell-arrays, in denen die entsprechenden Daten gespeichert
% werden. Zudem werden zwei counter erstellt
temp = cell(1,2);
cloud = cell(1,1);
prec = cell(1,3);

counter1 = 1;
counter2 = 1;

% Z�hlschleife, in der die Temperatur, die Bew�lkung und der Niederschlag
% aus der Struktur content_st herausgesucht werden in den dazugeh�rigen
% cell-arrays (temp, cloud, prec) gespeichert werden. 
for kk = 1:length(content_st.children{1}.children{2}.children)
    
    if strcmp(content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.name,'temperature');
        
        temp(counter1,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
        temp(counter1,2) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.attributes.value};
        cloud (counter1,1) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{6}.attributes.percent};

        counter1 = counter1 + 1;
    end
    
    if strcmp(content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.name,'precipitation');
        
        prec(counter2,1) = {content_st.children{1}.children{2}.children{kk}.attributes.from};
        prec(counter2,2) = {content_st.children{1}.children{2}.children{kk}.attributes.to};
        prec(counter2,3) = {content_st.children{1}.children{2}.children{kk}.children{1}.children{1}.attributes.value};
        
        counter2 = counter2 + 1;
    end
end   

% Heraussuchen aller Daten (Plural von Datum!)aus dem Temperatur-/ bzw. 
% Niederschlags cell-array 
datum_full1 = regexp(temp(:,1),'[0-9]+-[0-9]+-[0-9]+','match');
datum_full2 = regexp(prec(:,1),'[0-9]+-[0-9]+-[0-9]+','match');

% Aufruf der Funktion data_per_hour
[weather24hdata] = data_per_hour(temp(:,1),temp(:,2),cloud,prec(:,3));

% Alle mehrfach vorhandenen Daten werden hier entfernt
datum1 = unique(vertcat(datum_full1{:}));
datum2 = unique(vertcat(datum_full2{:}));

% Erstellen eines neuen cell-arrays, in den das Datum , die Minimal- und die 
% Maximaltemperatur der n�chsten 10 Tage gespeichert werden 
temp_min_max = cell(length(datum1),3);

% Erstellen eines neuen cell-arrays, in den der mittlere Bew�lkungswert 
% der n�chsten 10 Tage gespeichert wird
cloud_mean = cell(length(datum1),1);

% Schleife, in der die Temperatur-/ Bew�lkungsdaten von jedem Datum  
% herausgesucht werden. Von jedem Tag wird die Minimal-/
% Maximaltemperatur und der mittlere Bew�lkungswert bestimmt und zusammen
% mit dem entsprechendem Datum gespeichert.
for kk = 1:length(datum1)
    
    row1 = ~cellfun(@isempty, regexp(temp(:,1), datum1(kk)));
    row2 = find(row1 == 1);
    
    temp_all = str2double(temp(row2,2));
   
    cloud_all = str2double(cloud(row2,1));
       
    temp_min_max{kk,1} = datum1{kk}; 
    temp_min_max{kk,2} = min(temp_all);
    temp_min_max{kk,3} = max(temp_all);
    cloud_mean{kk,1} = mean(cloud_all); 
    
end

% Erstellen eines neuen cell-arrays, in den der mittlere Niederschlagswert
% und das Datum der n�chsten 10 Tage gespeichert wird 
prec_mean = cell(length(datum2),2);

% Schleife, in der f�r alle Tage der Mittelwert des Niederschlages gebildet 
% und zusammen mit dem entsprechendem Datum in dem cell-array gespeichert 
% wird. Anmerkung: Niederschlagswerte liegen nicht st�ndlich -wie Temperatur
% und Bew�kung- vor, sondern in unterschiedlichen Intervallen. F�r die 
% Zuordnung zu den jeweiligen Tagen werden andere Zeilenangaben ben�tigt. 
% Um die �bersichtlichkeit zu wahren, findet dieser Arbeitsschritt in einer 
% gesonderten  Schleife statt
for kk = 1:length(datum2)
    
    row1 = ~cellfun(@isempty, regexp(prec(:,1), datum2(kk)));
    row2 = find(row1 == 1);
    
    prec_all = str2double(prec(row2,3));
       
    prec_mean{kk,1} = datum2{kk};
    prec_mean{kk,2} = mean(prec_all);

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