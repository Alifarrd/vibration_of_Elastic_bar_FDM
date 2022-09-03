program vibrationobar
implicit none
INTEGER::i,j,jb,jt
REAL::c,b,f,a,e,dl,pi,dt,z,l,tt
real,allocatable::u(:),u1(:),u3(:,:)
OPEN(UNIT=10,FILE='ans.txt',STATUS='replace',ACTION='write')
OPEN(UNIT=11,FILE='plot.plt',STATUS='replace',ACTION='write')
f=10.
a=0.01
e=2e9
c=1.
dl=1 !0.25/32
dt=0.0001 !500 !0.25/64
b=(f*dl)/(a*e)
pi=3.14
l=4
tt=0.05!1e9
jb=floor(l/dl)+1
jt=floor(tt/dt)+1
ALLOCATE (u(jb),u1(jb),u3(jt,jb))
!================================IC
do i=1,jb
  u(i)=0
  end do
!=================================
do i=2,jb-1
 u1(i)=u(i)+(0.5*C**2)*(u(i-1)-(2*u(i))+u(i+1))
 end do
 u1(1)=0
z=(b+u1(jb-1)-u(jb))/dt
u1(jb)=(z*dt)+u(jb)
 !----------------
 do i=1,jb
  u3(1,i)=u(i)
  u3(2,i)=u1(i)
  end do
 !---------------
 do i=3,jt
   do j=2,jb-1
   u3(i,1)=0
   u3(i,j)=(2*u3(i-1,j))-u3(i-2,j)+(c**2)*(u3(i-1,j-1)-2*(u3(i-1,j))+u3(i-1,j+1))
 end do
z=(b+u3(i,jb-1)-u3(i-1,jb))/dt
u3(i,jb)=(z*dt)+u3(i-1,jb)
 end do
!-----------------
write(11,*)'titele'
write(11,*)'variabeles=x,t,u'
write(11,*)'zone'
write(11,*)'i=',jb,'j=',jt
write(11,*)'f=point'
    do i=1,jt
    do j=1,jb
 write(11,*)i,j,u3(i,j)
 end do
 end do
 !----------------
  end program