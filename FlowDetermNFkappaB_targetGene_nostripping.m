function y= FlowDetermNFkappaB_targetGene_nostripping(t,x)

%We use this procedure to use the desired data because there is 
%no way to find the zeros of a two-input function

load vectorparamused.mat



ka1=vectorparam(1);
kd1=vectorparam(2);
dI1=vectorparam(3);
dC1= vectorparam(4);
dIS1= vectorparam(5);
dCS1= vectorparam(6);
dS= vectorparam(7);
kR1=vectorparam(8);
dR1= vectorparam(9);
kI1= vectorparam(10);
k1N1= vectorparam(11);
k0I1= vectorparam(12);
k01= vectorparam(13);
k11= vectorparam(14);
k1N1= vectorparam(15);
k0I1= vectorparam(16);
k01= vectorparam(17);
k11=vectorparam(18);
Ntot=vectorparam(19);
S=vectorparam(20);
kNt=vectorparam(21);
kIt=vectorparam(22);
kRt=vectorparam(23);
dRt=vectorparam(24);


N=x(1);

I=x(2);

G=x(3);

R=x(4); 

Gt=x(5); 

Rt=x(6); 


fA=-ka1*N*I+kd1*(Ntot-N)+dC1*(Ntot-N)+dCS1*S*(Ntot-N);

fI=-ka1*N*I+kd1*(Ntot-N)-dI1*I-dIS1*S*I+kI1*R;

fG=k1N1*N*(2-G)-k0I1*I*G; 

fR=kR1*G-dR1*R; 

fGt=kNt*N*(1-Gt)-kIt*Gt; 

fRt=kRt*Gt-dRt*Rt; 


y=[fA,fI,fG,fR,fGt,fRt]';
