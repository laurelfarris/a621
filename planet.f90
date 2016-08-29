!Programmer(s):         Laurel Farris
!Course:                ASTR 621 
!Files:                 N/A
!Functions:             N/A
!Last modified:         25 February 2015
!Description:           Investigation of thermal processes during the
!                       mass accretion of a protoplanet

module stuff

double precision        :: G=6.67e-8
double precision        :: pi=3.14

double precision        :: R=6.4e6
double precision        :: R_final=6.4e8 
double precision        :: density=5.5
double precision        :: T=300.0
double precision        :: C_p=1.0e7
double precision        :: M_final=6.0e27
double precision        :: timestep=1.0
double precision        :: U,M,mass,radius,v,i
real,dimension(4)       :: X

end module stuff

program build_a_planet
use stuff
implicit none

open(unit=1,file='radius.dat')
open(unit=2,file='temp.dat')

X(1)=M_final/10000.0 ! part i
X(2)=M_final/1000.0  ! part ii
X(3)=R_final/10000.0 ! part iii
X(4)=R_final/1000.0  ! part iv

M=density*(4.0/3.0)*pi*R**3.0

i=4 !Edit according to which scenerio you would like to investigate

if (i==1 .or. i==2) then
 mass=timestep*X(i)
 do while (M<=M_final)
  M=M + mass
  R=((3.0*M)/(4.0*pi*density))**(1.0/3.0)
  U=G*M*mass/R
  T=U/(mass*C_p)
  write(1,*) R
  write(2,*) T
 end do

else if (i==3 .or. i==4) then 
 radius=timestep*X(i)
 do while (R<=R_final)
  mass=density*(4.0/3.0)*pi*(((R+radius)**3)-(R**3))
  R=R+radius
  M=density*(4.0/3.0)*pi*R**3.0
  U=G*M*mass/R
  T=U/(mass*C_p)
  write(1,*) R
  write(2,*) T
 end do
end if
  print*, mass*C_p
  print*,T
v = (2.0*G*M/R)**(0.5) !Check that escape velocity = v_esc(Earth)
!print*, v

end program
