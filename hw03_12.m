close all; clear all; clc;

%Constants
G = 6.67e-8;

M_sun = 3.0;
R_AU = 2.0;
R = 4e8;
M=1e27;
sigma=10;
T = 300;
v = 1e5;
Volume = (4/3)*pi*(R^3);
p = M/Volume;

n = sqrt(G*M_sun/(R_AU^3));

v = 1e5;
ve = sqrt(2*G*M/R);
Fg = (1+((ve/v)^2));

RateOfGrowth = ((sqrt(3/pi))*(sigma*n*Fg)/(4*p))*pi*1e7;

initialMass = 1.0e24*(R_AU^2*sigma)^(3/2)