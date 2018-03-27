% Lab 5.3   Finita differensmetoden, ger noggrannhetsordning p = 2
clear all, close all, clc

%% Givna v�rden till uppgiften
L = 2;          % Stavens l�ngd [m] (X) 0-2
a = 0.01;       % Tv�rsnittsarean [m^2]
k = 2.5;        % V�rmeledningsf�rm�ga [J/(K*m*s)]
T0 = 300;       % V�nster �ndpunkts temperatur [K]
TL = 400;       % H�ger �ndpunkts temperatur [K]

%% BB) (A p� papper)

% Ber�knar med hj�lp av finita differensmetoden  (y �r temperaturen och x �r l�get i staven)
%n=3
n = 249;                                   % Steg vi tar (givet)      
h = L/(n + 1);                             % Stegl�ngd f�r ber�kningen
x = (1:n)'*h;                              % x-v�rden som antas
e = ones(n,1);                             % Del i att skapa matrisen A
A = spdiags([e h^2-2*e e], -1:1, n,n);     % Skapar matrisen A (blir en diagonalmatris 1 h^2-2 1 p� diagonalen)
RV = zeros(n,1);                           % Skapar matrisen f�r randvillkoren
RV(1) = T0; RV(n) = TL;                    % Anger randvillkoren (dvs �ndpunkterna)
b = (h^2/k)*x-RV;                          % Skapar matrisen b
y = A\b;                                   % Ber�knar y-v�rdena

tempmax = max(y);                             % Den maximala temperaturen i staven
x1=[0,x',2];
y1=[300,y',400];
disp(['Den maximala temperaturen i staven �r ' num2str(tempmax) ' K.'])

% Plottar temperaturskillnaden i staven
plot(x1,y1);
title('Temperaturskillnaden i staven beroende p� l�ge')
xlabel('L�ngden p� cylindern  [m]')
ylabel('Temperaturen i staven [K]')
grid on

%% B)

% Ber�knar v�rmefl�det (VaflodvF) i �ndpunkterna i staven

Vaflodv = - a*k*((-y(3) + 4*y(2) - 3*y(1))/(2*h));        % V�rmefl�det i v�ster �nde av staven

VFh = -( a*k*((-y(n) + 4*y(n-1) - 3*y(n-2))/(2*h)));    % V�rmefl�det i h�ger �nde av staven  

disp(['V�rmefl�det i v�nster �nde av staven �r ' num2str(Vaflodv) ' och i h�ger �nde ' num2str(VFh) '.'])

% OBS!! Negativt tecken framf�r v�rmefl�det b�r betyda att v�rme avges, och motsatt f�r positivt.
