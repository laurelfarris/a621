% Laurel Farris
% ASTR 545 project
% 14 December 2014

close all; clear all; clc


fid = fopen('radius1.dat','r');    
R = fscanf(fid,'%f');          
fclose(fid);
fid = fopen('temp1.dat','r');
T = fscanf(fid,'%f');
fclose(fid);
fid = fopen('temp2.dat','r');
T2 = fscanf(fid,'%f');
fclose(fid);

R = R./(6.4e8);

%T=log10(T);
%T2=log10(T2);

 plot(R,T)
  hold on
  plot(R,T2,'r')
      
 %axis([0 1 0 500]);
% 
% legend('i=1,P=1');
% 
 xlabel('Radius (R/R_{o})');
 ylabel('T (K)');