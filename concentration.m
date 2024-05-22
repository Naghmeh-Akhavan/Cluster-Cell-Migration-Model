function  c = concentration(x)
% Steady state solution of the chemoattractant concentration
% refer to the readme.md for more information
% change parameter on initial_setup.m
%
% by Naghmeh Akhavan 2024 


d = initial_setup();

A = pi*d.rb^2;
s = 1/A;
a0 = (d.b0-d.rb)/d.xhat0;
a4 = (d.b4-d.rb)/d.xhat4;
b0 = d.b0;
b4 = d.b4;

x0 = d.x0;
x1 = d.x1;
x2 = d.x2;
x4 = d.x4;
x3 = d.x3;
x5 = d.x5;

D = d.D;
k = d.k;
L = d.L;

lam1 =sqrt(k/D);
lam2=-sqrt(k/D);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CONSTANTS
M1=exp(-2*lam1*L)*exp(lam1*x5)+exp(lam2*x5);
k1=s*exp(lam1*x5)./(D*A*lam1*exp(lam1*L));

M2=lam1*exp(-2*lam1*d.L)*exp(lam1*x5)+lam2*exp(lam2*x5);
k2=s*exp(lam1*x5)./(D*A*exp(lam1*L));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%cont
%at x1
p1= exp(lam1*x1)+exp(lam2*x1);
p2= -exp(lam1*x1)./(a0*(x1-x0)+b0);
p3= -exp(lam2*x1)./(a0*(x1-x0)+b0);

%at x0
p4= exp(lam1*x0)./b0;
p5= exp(lam2*x0)./b0;
p6=exp(lam1*x0)./b0;
p7=exp(lam2*x0)./b0;

%at x2
p8=exp(lam1*x2)./(a0*(x2-x0)-b0);
p9=exp(lam2*x2)./(a0*(x2-x0)-b0);
p10=-exp(lam1*x2);
p11=-exp(lam2*x2);

%at x3
p12=exp(lam1*x3);
p13=exp(lam2*x3);
p14=-exp(lam1*x3)./(a4*(x3-x4)+b4);
p15=-exp(lam2*x3)./(a4*(x3-x4)+b4);

%at x4
p16= exp(lam1*x4)./b4;
p17= exp(lam2*x4)./b4;
p18=exp(lam1*x4)./b4;
p19=exp(lam2*x4)./b4;

%at x5
p20=exp(lam1*x5)./(a4*(x5-x4)-b4);
p21=exp(lam2*x5)./(a4*(x5-x4)-b4);
p22=-M1;

%at x1
p23=lam1*exp(lam1*x1)+lam2*exp(lam2*x1);
p24=-( (-a0./(a0*(x1-x0)+b0)^2)*exp(lam1*x1) + (lam1./(a0*(x1-x0)+b0))*exp(lam1*x1) );
p25=-( (-a0./(a0*(x1-x0)+b0)^2)*exp(lam2*x1) + (lam2./(a0*(x1-x0)+b0))*exp(lam2*x1) );

%at x0
p26= (-a0/b0^2)*exp(lam1*x0)+(lam1/b0)*exp(lam1*x0);
p27= (-a0/b0^2)*exp(lam2*x0)+(lam2/b0)*exp(lam2*x0);
p28=-( (-a0/b0^2)*exp(lam1*x0)-(lam1/b0)*exp(lam1*x0) );
p29=-( (-a0/b0^2)*exp(lam2*x0)-(lam2/b0)*exp(lam2*x0) );

%at x2
p30=(-a0./(a0*(x2-x0)-b0)^2)*exp(lam1*x2)+(lam1./(a0*(x2-x0)-b0))*exp(lam1*x2);
p31=(-a0./(a0*(x2-x0)-b0)^2)*exp(lam2*x2)+(lam2./(a0*(x2-x0)-b0))*exp(lam2*x2);
p32=-lam1*exp(lam1*x2);
p33=-lam2*exp(lam2*x2);

%at x3
p34=lam1*exp(lam1*x3);
p35=lam2*exp(lam2*x3);
p36=-( (-a4./(a4*(x3-x4)+b4)^2)*exp(lam1*x3) + (lam1./(a4*(x3-x4)+b4))*exp(lam1*x3) );
p37=-( (-a4./(a4*(x3-x4)+b4)^2)*exp(lam2*x3) + (lam2./(a4*(x3-x4)+b4))*exp(lam2*x3) );

%at x4
p38=(-a4/b4^2)*exp(lam1*x4)+(lam1/b4)*exp(lam1*x4);
p39=(-a4/b4^2)*exp(lam2*x4)+(lam2/b4)*exp(lam2*x4);
p40=-( (-a4/b4^2)*exp(lam1*x4)-(lam1/b4)*exp(lam1*x4) );
p41=-( (-a4/b4^2)*exp(lam2*x4)-(lam2/b4)*exp(lam2*x4) );

%at x5
p42=(-a4./(a4*(x5-x4)-b4)^2)*exp(lam1*x5)+(lam1./(a4*(x5-x4)-b4))*exp(lam1*x5);
p43=(-a4./(a4*(x5-x4)-b4)^2)*exp(lam2*x5)+(lam2./(a4*(x5-x4)-b4))*exp(lam2*x5);
p44=-M2;


M=[p1 p2 p3 0 0 0 0 0 0 0 0 0 0;
   0 p4 p5 p6 p7 0 0 0 0 0 0 0 0;
   0 0 0 p8 p9 p10 p11 0 0 0 0 0 0;
   0 0 0 0 0 p12 p13 p14 p15 0 0 0 0;
   0 0 0 0 0 0 0 p16 p17 p18 p19 0 0;
   0 0 0 0 0 0 0 0 0 p20 p21 p22 k1;
   p23 p24 p25 0 0 0 0 0 0 0 0 0 0;
   0 p26 p27 p28 p29 0 0 0 0 0 0 0 0;
   0 0 0 p30 p31 p32 p33 0 0 0 0 0 0;
   0 0 0 0 0 p34 p35 p36 p37 0 0 0 0;
   0 0 0 0 0 0 0 p38 p39 p40 p41 0 0;
   0 0 0 0 0 0 0 0 0 p42 p43 p44 k2];
R=rref(M);
A1=R(1,end);
A2=R(2,end);
B2=R(3,end);
A3=R(4,end);
B3=R(5,end);
A4=R(6,end);
B4=R(7,end);
A5=R(8,end);
B5=R(9,end);
A6=R(10,end);
B6=R(11,end);
B7=R(12,end);

%% solutions
K=s*exp(lam1*x)./(D*A*lam1*exp(lam1*L));
M=exp(2*lam2*L)*exp(lam1*x)+exp(lam2*x);

C1=A1*( exp(lam1*x) +exp(lam2*x) );
C2=A2*( exp(lam1*x)./(a0*(x-x0)+b0) )+B2*( exp(lam2*x)./(a0*(x-x0)+b0) );
C3=A3*( exp(lam1*x)./(a0*(x-x0)-b0) )+B3*( exp(lam2*x)./(a0*(x-x0)-b0) );
C4=A4*exp(lam1*x)+B4*exp(lam2*x);
C5=A5*( exp(lam1*x)./(a4*(x-x4)+b4) )+B5*( exp(lam2*x)./(a4*(x-x4)+b4) );
C6=A6*( exp(lam1*x)./(a4*(x-x4)-b4) )+B6*( exp(lam2*x)./(a4*(x-x4)-b4) );
C7=K + B7*M;

c=C1.*(x<=x1)+C2.*(x>x1).*(x<=x0)+C3.*(x>x0).*(x<=x2)+C4.*(x>x2).*(x<=x3)+C5.*(x>x3).*(x<=x4)+C6.*(x>x4).*(x<=x5)+C7.*(x>x5); 

end %c function

