program test

real, dimension(3) :: x
real*8 :: a

x(1)=1
x(2)=2
x(3)=3

!a=max(x(1),x(2),x(3))
a=maxval(x)
print*, a

end program
