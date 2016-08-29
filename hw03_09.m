close all; clear all; clc;

%Constants
G = 6.67e-8;

%Parameters (given)
R = 4.0e8;
R_AU = 1.0;
M_sun = 1.0;
M = 1.0e27;
sigma = 10/R_AU;
T = 300.0;
v = 1.0e5;
eta = 5.0e-3;

%Calculated shit

n = (sqrt(G*M_sun/(R_AU^3)));
Volume = (4.0/3.0)*pi*(R^3);
p = 10/(R_AU^2);
ve=sqrt(2*G*M/R);
Fg=1+((ve/v)^2);

RateOfGrowth = (sqrt(3/pi))*sigma*n*Fg/(4*p);
 
 Mplanetesimal = 16*(pi^2)*(G^2)*sigma^3/(n^4);
 Rplanetesimal = (3*Mplanetesimal/(4*pi*p))^(1/3)
 
 n_particle = (G*M_sun/(R_AU^3))*R_AU;
 n_gas = n_particle*(1-eta);
 n_relative = n_particle-n_gas;
 n_relative*pi*(10^7);
 
 
 RateOfGrowth = (RateOfGrowth*pi*10^7)/(10^5);
 
 Time = 6371.0/RateOfGrowth;
 