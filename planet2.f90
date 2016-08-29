!Programmer(s):         Laurel Farris
!Course:                ASTR 621 
!Files:                 N/A
!Functions:             N/A
!Last modified:         20 March 2015    
!Description:           Investigation of thermal processes during the
!                       mass accretion of a protoplanet, with the inclusion
!                       of radiactive decay heating
!                       Note: All units are in cgs                        

module stuff

!Constants
double precision        :: G=6.67e-8
double precision        :: pi=3.14

double precision        :: R_initial=6.4e6,R_final=6.4e8,M_final=6.0e27
double precision        :: tau,tau_current=4.0e-8 !Radioactive decay heating
double precision        :: tau_initial
real*8,parameter        :: step=1000,step2=450
real*8,parameter        :: t1=10.0e7,t2=4.5e9 !Final times
real*8,parameter        :: array=step+step2
real*8,parameter        :: density=5.5,C_p=1.0e7
integer                 :: i,j,k
double precision        :: mass_inc,t_inc1,t_inc2=(t2-t1)/step,t
real,dimension(step)    :: R,M,U,temp,temp2

double precision        :: v_planet,v_Earth

!to be sorted
double precision        :: half_life=1.0e9

end module stuff

program build_a_planet
use stuff
implicit none

!open files for writing data to plot
open(unit=1,file='radius1.dat')
open(unit=2,file='temp1.dat')
open(unit=4,file='temp2.dat')

!mass increment
mass_inc=(M_final)/step

!initial values
R(0)=R_initial
M(0)=(4.0/3.0)*pi*density*(R(0))**3.0
U(0)=G*M(0)*mass_inc/(R(0))
temp(0)=U(0)/(mass_inc*C_p)

!radioactive heating rate
tau_initial=tau_current/((0.5)**(t2/half_life))

!--------------Start Accretion of Matter--------------!

  do i=1,step-1
   M(i)=M(i-1)+mass_inc
   R(i)=((3.0*M(i))/(4.0*pi*density))**(1.0/3.0)
   U(i)=G*M(i)*mass_inc/(R(i))
   temp(i)=U(i)/(mass_inc*C_p)
  end do
write(1,*) R
write(2,*) temp

t=t1
 
do i=step,array-1
   t=t+t_inc2
   tau=tau_initial*0.5**(t/half_life)
    do j=1,step-1
      temp(j)=temp(j)+(tau/C_p)*t_inc2*(pi*1.0e7)
    end do
end do
write(4,*) temp

!Check that escape velocity = v_esc(Earth)
v_planet = (2.0*G*M(step-1)/(R(step-1)))**(0.5)
v_Earth = (2.0*G*6.0e27/(6.4e8))**(0.5)
!print*, v_planet
!print*, v_Earth

end program



