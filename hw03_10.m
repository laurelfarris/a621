close all; clear all; clc;

%Constants
G = 6.67e-8;

%Parameters (given)
R = 4.0e8;
R_AU = 5.0;
M_sun = 1.0;
M = 1.0e27;
sigma = 20/R_AU;
T = 300.0;
v = 1.0e5;
eta = 5.0e-3;

%Calculated shit

n = (sqrt(G*M_sun/(R_AU^3)));
Volume = (4.0/3.0)*pi*(R^3);
p = sigma/R_AU;
ve=sqrt(2*G*M/R);
 
 Mplanetesimal = 16*(pi^2)*(G^2)*sigma^3/(n^4)
 Rplanetesimal = (3*Mplanetesimal/(4*pi*p))^(1/3)