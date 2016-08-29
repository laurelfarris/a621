close all; clear all; clc;

Msun = 2.0e33;

fid = fopen('temp.dat','r');    
T = fscanf(fid,'%f');          
fclose(fid);
fid = fopen('density.dat','r');
p = fscanf(fid,'%f');
fclose(fid);
fid = fopen('jeans_mass_2.dat','r');
MJ1 = fscanf(fid,'%f');
fclose(fid);
%fid = fopen('jeans_mass_2.dat','r');
%MJ2 = fscanf(fid,'%f');
%fclose(fid);

MJ1 = reshape(MJ1,[500 500]);
MJ1 = MJ1./(log10(Msun));

min1 = log10(5.0e-4);
max1 = log10(2.0e-3);
min2 = log10(0.5);
max2 = log10(2.0);
min3 = log10(8.0);
max3 = log10(12.0);
min4 = log10(5.0e10);
max4 = log10(1.0e11);

pcolor(T,p,MJ1)
shading interp
hold on

%contour(T,p,MJ1,[min4 min4],'color','k','lineWidth',2)

%contour(T,p,Mindex);

xlabel('Temperature (K)');
ylabel('log density (g cm{^-}{^3})');