;Programmer(s):		Laurel Farris
;Course:		ASTR 621
;File Name:		planet3.pro
;Last modified:		14 April 2015
;Description:		"Build-a-Planet" part 3
;			Note: All units are in cgs

;Constants
G = 6.67e-8
PI = 3.14
sigma = 5.67e-5

;Parameters
;emissivity = 1.0	;emissivity of a blackbody
emissivity = 0.333	;emissivity of an 'insulating' body
rho = 5.5		;density
Cp = 1.0e7		;specific heat
R_initial = 6.375e-3	;Initial radius of core
M_final = 5.976e27	;final mass of (earth-like) planet
inc1 = 1000		;Inc in 1000 equal masses and timesteps (part 1)
inc2 = 4400		;Inc in 4400 equal timesteps (part 2)
M_inc = M_final/inc1	;Mass increment
t1_final = 1.0e6	;final time (after accretion)
t2_final = 4.4e9	;final time (current age)
t1_inc = t1_final/inc1	;time increment (part 1)
t2_inc = 1.0e6		;time increment (part 2)
temp_initial = 300.0	;initial core temperature 
temp_eq = 255.0

temp = fltarr(1000)	;temperature array (1 for each layer)
radius = fltarr(1000)	;radius array...
mass = fltarr(1000)	;mass array
U = fltarr(1000)	;potential energy array
time = fltarr(5500)	;time array

;---------------------------------------------------------------------;

temp[0] = Temp_initial			;Initial temperature
radius[0] = R_initial			;Initial radius
mass[0] = (4.0/3.0)*!PI*rho*(R[0]^3.0)	;Initial mass
time[0] = 0.0				;Initial time
temp_sum = temp_initial			;sum of temps of all layers

for i = 1,(inc1-1) do begin ; accrete planet, calculate temperatures

 t[i] = t[i-1] + t1_inc		;increment time
 mass[i] = mass[i-1] + M_inc	;increment mass
 radius[i] = (3.0*mass[i]/(4.0*!PI*rho))^(1.0/3.0)
 U[i] = G*mass[i]*M_inc/radius[i] 
 temp[i] = (U[i]/(M_inc*Cp))
 delta_T = (emissivity*4.0*!PI*(radius[i])^2*sigma*((temp[i])^4-temp_eq^4))/(M_inc*Cp)
 temp[i] = temp[i] + delta_T
 temp_sum = temp_sum + temp[i]
 temp_avg = temp_sum/i
 
;--set temp of each layer = average temperature--;
  for j = 0,i do begin
    temp[j] = temp_avg
  endfor
;------------------------------------------------;

endfor

;Move forward in time to the present

for i = inc1,5499 do begin

 t[i] = t[i-1] + t2_inc
 

endfor


