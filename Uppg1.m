clear all, close all, clc
%% Stegl�ngder
h1 = 20/100;
h2 = 20/500;
h3 = 20/1000;

%% 1.1 Exakt l�sning

% Med ber�kningar f�r hand blir diff.ekv ->
% y(t) = (2/5)*sin(t) - (1/5)*cos(t) + (1/5)*e^(-2t)

% Exakt
% c = 1/5 
% c = ((cos(0))/5 - (2*sin(0))/5)/(e^(-2*0)
% y(t) = c*exp(-2*t) + (2*sin(t))/5 - (cos(t))/5;

% Ber�kna med olika stegl�ngder
% Exakt
% c = 1/5 
% c = ((cos(0))/5 - (2*sin(0))/5)/(e^(-2*0)
% y(t) = c*exp(-2*t) + (2*sin(t))/5 - (cos(t))/5;

t = [0:0.2:20]; % 100st element
exaktY1 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

t = [0:0.04:20]; % 500st element
exaktY2 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

t = [0:0.02:20]; % 1000st element
exaktY3 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

figure(1)        % Figur 1 (Alla Figure(1) hamnar i samma plot)
plot(t,exaktY3, 'c')
hold on          % H�ll kvar kurvan, samla p� alla kurvor till en plot
title('Exakt l�sning')

%% 1.2 Eulers metod

% Antal steg 100
 n = 100;                   % Antal steg         
 y = 0;                     % Funktionens startv�rde (y_0)
 t = 0;                     % F�rsta t-v�rdet
 T = t;                     
 Y1 = y;                    
 h = 20/100;                % Stegl�ngden
    
for i=1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen 
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % N�sta steg. T flyttas med steget h
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y1 = [Y1; y];           % Sparar alla gamla och nya v�rden
end

figure(1)                   % Figur 1 (Alla Figure(1) hamnar i samma plot)
plot(T,Y1, 'b');
hold on                     % H�ll kvar kurvan, samla p� alla kurvor till en plot
title('Eulers Metod')

% Antal steg 500
n = 500;                    % Antal steg
y = 0;                      % Funktionens startv�rde (y_0)
t = 0;
T = t;
Y2 = y;
h = 20/500;                 % Stegl�ngd
    
for i=1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen 
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % N�sta steg. T flyttas med steget h
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y2 = [Y2; y];           % Sparar alla gamla och nya v�rden
end

figure(1)                   % Figur 1 (Alla Figure(1) hamnar i samma plot)
plot(T,Y2, 'r');
hold on                     % H�ll kvar kurvan, samla p� alla kurvor till en plot

% Antal steg 1000        
n = 1000;                   % Antal steg
y = 0;                      % Funktionens startv�rde (y_0)
t = 0;
T = t;
Y3 = y;
h = 20/1000;                % Stegl�ngd

for i=1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen 
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % N�sta steg. T flyttas med steget h
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y3 = [Y3; y];           % Sparar alla gamla och nya v�rden
end
        
figure(1)                   % Figur 1 (Alla Figure(1) hamnar i samma plot)
plot(T,Y3, 'g');
legend('Exakt', 'Y1', 'Y2', 'Y3') % Ruta i h�rnet av plot
hold on                      % H�ll kvar kurvan, samla p� alla kurvor till en plot

%% Felet som funktion av stegl�ngd

F1 = abs(exaktY1(end)-Y1(end));     % Felet d�r h varierar och t=20
F2 = abs(exaktY2(end)-Y2(end));
F3 = abs(exaktY3(end)-Y3(end));

FV = [F3, F2, F1];                  % Vektor f�r att plotta alla fel
hV = [h3, h2, h1];                  % Vektor f�r att plotta alla stegl�ngder

figure(2)                           % Figur 2
loglog(hV, FV, 'r-o', hV, hV, 'b-') % Loglog-diagram (Axlarna i logaritm-skala)
% hV och FV �r r�da streck med ringar, hV och hV �r bl�a streck
ylabel('Felv�rden f�r Euler')
xlabel('Stegl�ngden')
legend('Felet', 'Nogrannhetsordning 1') % Rutan i h�rnet
grid on                                 % Rutn�t
title('Nogrannhetsordning Euler')   
axis equal                              % Axlar lika stora

%% Trapetsmetoden
% Exakt samma saker som i Euler ovan g�rs f�r trapetsmetoden.

% Stegl�ngd 100
 n = 100;                    % Antal steg
 y = 0;                      % Funktionens startv�rde
 t = 0;
 T = t;
 Y1 = y;    
 h = 20/100;                 % Stegl�ngd 0.2
    
for i=1:n               % F�r varje element fr�n 1 till n
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);  % Trapetsmetoden
    t = t+h;            % G�r fram ett steg
    T = [T; t];         % Sparar alla gamla och nya v�rden
    Y1 = [Y1; y];       % Sparar alla gamla och nya v�rden
end

figure(3)                   % Figur 3 (Alla Figure(3) hamnar i samma plot)
plot(T,Y1, 'b');
hold on          % H�ll kvar kurvan, samla p� alla kurvor till en plot
title('Trapetsmetoden')

% Stegl�ngd 500
n = 500;                    % Antal steg
y = 0;                      % Funktionens startv�rde
t = 0;
T = t;
Y2 = y;
h = 20/500;                 % Stegl�ngd 0.4
    
for i=1:n                 % F�r varje element fr�n 1 till n
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;              % G�r fram ett steg
    T = [T; t];           % Sparar alla gamla och nya v�rden
    Y2 = [Y2; y];         % Sparar alla gamla och nya v�rden
end

figure(3)                   % Figur 3 (Alla Figure(3) hamnar i samma plot)
plot(T,Y2, 'r');
hold on          % H�ll kvar kurvan, samla p� alla kurvor till en plot

% Stegl�ngd 1000        
n = 1000;                   % Antal steg
y = 0;                      % Funktionens startv�rde
t = 0;
T = t;
Y3 = y;
h = 20/1000;                % Stegl�ngd 0.02

for i=1:n                   % F�r varje element fr�n 1 till n
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y3 = [Y3; y];           % Sparar alla gamla och nya v�rden
end
        
figure(3)                   % Figur 3 (Alla Figure(3) hamnar i samma plot)
plot(T,Y3, 'g');
hold on          % H�ll kvar kurvan, samla p� alla kurvor till en plot

% Exakt 
t = [0:0.02:20];
exaktY3 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

figure(3)                   % Figur 3 (Alla Figure(3) hamnar i samma plot)
plot(t,exaktY3)             % Plotta exakta v�rdet Y3 (fr�n i b�rjan)
plot(T,Y3)                  % Plotta Y3
legend('Y1','Y2','Y3','Exakt')% Ruta i h�rnet av plot
hold off          % Sluta h�lla i kurvorna

%% Felet som funktion av stegl�ngden 

F1 = abs(exaktY1(end)-Y1(end));     % Felet d�r h varierar och t=20
F2 = abs(exaktY2(end)-Y2(end));
F3 = abs(exaktY3(end)-Y3(end));

FV = [F3, F2, F1];                  % Vektor f�r att plotta alla fel
hV = [h3, h2, h1];                  % Vektor f�r att plotta alla stegl�ngder

figure(4)                           % Figur 4
loglog(hV, FV, 'r-o',hV,hV.^2, 'b-')        % hv.^2 ger noggranhetsordning 2
ylabel('Felv�rden f�r trapetsmetoden')
xlabel('Stegl�ngden')
legend('Felet', 'Nogrannhetsordning 2')% Ruta i h�rnet av plot
grid on     % Rutn�t
axis equal  % Axlar lika l�nga
title('Norgrannhetsordning trapetsmetoden')

%% 1.3 Euler och Trapets d�r tidsintervallet �r uppdelat i fyra steg
%Euler

% Stegl�ngder
h1 = 20/40;
h2 = 20/20;
h3 = 20/10;
h4 = 20/5;

% Stegl�ngd 40
t = 0;
y = 0;
h = h1; % Stegl�ngd
n = 40; % Antal steg
T = [t];
Y1 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n  
    f = sin(t)-2*y;         % Funktionen
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y1 = [Y1; y];             % Sparar alla gamla och nya v�rden
end
figure(5)
plot(T,Y1)
hold all
title('Euler med tidsintervall uppdelat i 4')

% Stegl�ngd 20
t = 0;
y = 0;
h = h2; % Stegl�ngd
n = 20; % Antal steg
T = [t];
Y2 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y2 = [Y2; y];             % Sparar alla gamla och nya v�rden
end
plot(T,Y2)

% Stegl�ngd 10
t = 0;
y = 0;
h = h3; % Stegl�ngd
n = 10; % Antal steg
T = [t];
Y3 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y3 = [Y3; y];             % Sparar alla gamla och nya v�rden
end
plot(T,Y3)

% Stegl�ngd 5
t = 0;
y = 0;
h = h4; % Stegl�ngd
n = 5; % Antal steg
T = [t];
Y4 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n
    f = sin(t)-2*y;         % Funktionen
    y = y+h*f;              % Eulers metod: y = y + h*f
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y4 = [Y4; y];             % Sparar alla gamla och nya v�rden
end
plot(T,Y4)

% Exakta v�rden (Fr�n i b�rjan)
t = [0:0.02:20];
exaktY1 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

plot(t,exaktY1)
legend('Y1', 'Y2', 'Y3', 'Y4', 'Exakt') % Ruta i h�rnet av plot
hold off

%% Trapetsmetoden

% Stegl�ngd 40
t = 0;
y = 0;
h = h1; % Stegl�ngd
n = 20/h; % Antal steg
T = [t];
Y1 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n   
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y1 = [Y1; y];             % Sparar alla gamla och nya v�rden
end
figure(6)
plot(T,Y1)
hold all
title('Trapetsmetoden med tidsintervall uppdelat i 4')

% Stegl�ngd 20
t = 0;
y = 0;
h = h2; % Stegl�ngd
n = 20/h; % Antal steg
T = [t];
Y2 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y2 = [Y2; y];             % Sparar alla gamla och nya v�rden
end

plot(T,Y2)

% Stegl�ngd 10
t = 0;
y = 0;
h = h3; % Stegl�ngd
n = 20/h; % Antal steg
T = [t];
Y3 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n 
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y3 = [Y3; y];             % Sparar alla gamla och nya v�rden
end
plot(T,Y3)

% Stegl�ngd 5
t = 0;
y = 0;
h = h4; % Stegl�ngd
n = 20/h; % Antal steg
T = [t];
Y4 = [y];

for i= 1:n                   % F�r varje element fr�n 1 till n
    y = (y+h/2.*(sin(t)-2*y)+(h/2)*sin(t+h))/(h+1);
    t = t+h;                % G�r fram ett steg
    T = [T; t];             % Sparar alla gamla och nya v�rden
    Y4 = [Y4; y];             % Sparar alla gamla och nya v�rden
end

plot(T,Y4)

% Exakt
t = [0:0.02:20];
exaktY1 = 1/5*exp(-2*t)+2/5*sin(t)-1/5*cos(t);

plot(t,exaktY1)

legend('Y1','Y2', 'Y3', 'Y4', 'Exakt')% Ruta i h�rnet av plot
hold off