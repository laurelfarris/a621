!Programmer(s):         Laurel Farris
!Course:                ASTR 621 
!Files:                 N/A
!Functions:             N/A
!Last modified:         02 March 2015    
!Description:           Calculating and Contouring Jeans Mass values
!                       vs. Temperature and Density

module stuff
real*8                  :: x,y,z,i
real*8,parameter        :: species=2

!Constants
double precision        :: pi=3.14
double precision        :: k=1.3807e-16
double precision        :: G=6.6726e8
double precision        :: amu=1.67e-24

!Parameters
real*8,parameter        :: sample=500.0
double precision        :: Tmin=5.0, Tmax=500.0, Tinc
double precision        :: MJmin=log10((2.0e33)*(1.0e-4))
double precision        :: MJmax=44.3010!log10((2.0e33)*(1.0e11))
real,dimension(sample,sample) :: MJ_1,MJ_2
double precision        :: rho_min,rho_max,rho_inc
real,dimension(8)       :: test_rho
real,dimension(species) :: m
real,dimension(sample)  :: T,rho
double precision        :: const

end module stuff

program jeans_mass
use stuff
implicit none

m(1)=1.00795*2.0
m(2)=4.00260

!Find min and max values for density
test_rho(1)=3/(4*pi*((10**MJmin)*(5*k*Tmin/(G*m(1)*amu)**(-3/2)))**2)
test_rho(2)=3/(4*pi*((10**MJmax)*(5*k*Tmin/(G*m(1)*amu)**(-3/2)))**2)
test_rho(3)=3/(4*pi*((10**MJmin)*(5*k*Tmax/(G*m(1)*amu)**(-3/2)))**2)
test_rho(4)=3/(4*pi*((10**MJmax)*(5*k*Tmax/(G*m(1)*amu)**(-3/2)))**2)
test_rho(5)=3/(4*pi*((10**MJmin)*(5*k*Tmin/(G*m(2)*amu)**(-3/2)))**2)
test_rho(6)=3/(4*pi*((10**MJmax)*(5*k*Tmin/(G*m(2)*amu)**(-3/2)))**2)
test_rho(7)=3/(4*pi*((10**MJmin)*(5*k*Tmax/(G*m(2)*amu)**(-3/2)))**2)
test_rho(8)=3/(4*pi*((10**MJmax)*(5*k*Tmax/(G*m(2)*amu)**(-3/2)))**2)

rho_max=maxval(test_rho)
rho_min=minval(test_rho)

!Set increments for temperature and density
Tinc=(Tmax-Tmin)/sample
rho_inc=(log10(rho_max)-log10(rho_min))/sample

!Set arrays for temperature and density
T(1)=Tmin
rho(1)=log10(rho_min)

do i=2,sample
 T(i)=T(i-1)+Tinc
 rho(i)=(rho(i-1))+rho_inc
end do

!Calculate Jeans Mass
 do y=1,sample 
  do z=1,sample 
   MJ_1(z,y)=(((5.0*k*T(y)/(G*m(1)*amu))**(3.0/2.0))* &
               (3.0/(4.0*pi*10**rho(z)))**(1.0/2.0))
   MJ_2(z,y)=(0.72*((5.0*k*T(y)/(G*m(1)*amu))**(3.0/2.0))* &
                        (3.0/(4.0*pi*10**rho(z)))**(1.0/2.0) + &
             0.28*((5.0*k*T(y)/(G*m(2)*amu))**(3.0/2.0))* &
                        (3.0/(4.0*pi*10**rho(z)))**(1.0/2.0))
  end do 
 end do

open(unit=1,file='temp.dat')
open(unit=2,file='density.dat')
open(unit=3,file='jeans_mass_1.dat')
open(unit=4,file='jeans_mass_2.dat')

write(1,*) T
write(2,*) rho
write(3,*) log10(MJ_1)
write(4,*) log10(MJ_2)

close(unit=1)
close(unit=2)
close(unit=3)
close(unit=4)

end program
