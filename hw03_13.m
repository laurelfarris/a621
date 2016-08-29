close all; clear all; clc;

G = 6.67e-8;

Rin = 25.0*1.5e13;
Rout = 35.0*1.5e13;
SA = pi*(Rout^2-Rin^2);
Mnep = 1.024e29;
sigma = Mnep/SA;
Rnep = 2.4622e9;
n = sqrt(G/(30.0^3));
Fg = 10.0;
Volume = (4.0/3.0)*pi*(Rnep^3);
p = Mnep/Volume;

t = (Rnep/((sqrt(3/pi))*sigma*n*Fg/(4*p)))/(pi*(10^7))