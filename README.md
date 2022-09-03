# vibration_of_Elastic_bar_FDM
This is a finite difference method program which developed by Fortran to solve the equations of vibration of the elastic bars in the axial direction.
Consider uniaxial wave propagation in a elastic bar of length L, fixed at one end $(z=0)$ and subjected to a suddenly applied constant axial force $F$ at the other end $(z=L)$. 

the equation of motion for an elastic bar is:

$(∂^2 u_z/∂t^2) - c_t^2(∂^2 u_z/∂z^2)=0$

The initial conditions are:

$u_z(z=0)=0 , E_0(∂ u_z/∂t)=0$ 

and the boundary conditions are:

$u_z(0,t)=0 , E_0(∂ u_z/∂t)=F_0/A_t$ 

