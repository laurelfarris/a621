% Laurel Farris
% ASTR 545 project
% 14 December 2014

close all; clear all; clc


fid = fopen('radius.dat','r');    
R = fscanf(fid,'%f');          
fclose(fid);
fid = fopen('temp.dat','r');
T = fscanf(fid,'%f');
fclose(fid);

R = R./(6.4e8);

T=log(T);
  plot(R,T)
      
 axis([0 1 0 log(70000.0)]);
% 
% legend('i=1,P=1');
% 
 xlabel('Radius (R/R_{o})');
 ylabel('log T (K)');