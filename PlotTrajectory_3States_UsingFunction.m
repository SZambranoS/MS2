
clear

hold off;

close all;



ka1=1.900000e-06; 
kd1=8.400000e-04; 
dI1=6.700000e-05; 
dC1 =1.340000e-05; 
dIS1= 5.000000e-09; 
dCS1 =2.500000e-08; 
dS =0.000000e+00;
kR1 =2.000000e-01;
kR1 =2.000000e-01;
dR1 =7.500000e-04;
kI1 =2.500000e-01;
k1N1 =6.900000e-08; 
k0I1 =1.400000e-08;
k01 =0.000000e+00;
k11 =0.000000e+00;
k1N1 =6.900000e-08;
k0I1 =1.400000e-08; 
k01 =0.000000e+00;
k11 =0.000000e+00;

Ntot=3*10^4;
%S=10^5;

S=0;

vectorparam0=[ka1, kd1, dI1, dC1, dIS1, dCS1, dS, kR1, dR1, kI1, k1N1, k0I1, k01, k11, k1N1, k0I1, k01, k11,Ntot,S];

kNt=5*k1N1;
koff1=10*k0I1*(1.5e4);
koff2=k0I1*(1.5e4); %1.5e4 is the mean value of IkappaBalpha post stimulus
ki=8.330000e-03;
ke=1.330000e-02; 

vectorgene_nascent3states=[kNt,koff1,koff2,ki,ke]; 

vectorparam=[vectorparam0,vectorgene_nascent3states]; 


[tODE,DataODE]=DoFlow3hModelRefractory(vectorparam);


close all
hold off

h=figure(1) 
hold off
set(h, 'Color', 'w');

set(h, 'units','normalized', 'Position', [.2 .2 .3 .4])

set(gca,'Fontsize',12)

figure(1)
plot(tODE/3600,Signal0to1(DataODE(:,1)),'r','linewidth',2);
hold on;
plot(tODE/3600,Signal0to1(DataODE(:,2)),'k','linewidth',2);
plot(tODE/3600,Signal0to1(DataODE(:,3)),'b','linewidth',2);
%plot(tODE/3600,Signal0to1(DataODE(:,4)),'g','linewidth',2);
plot(tODE/3600,Signal0to1(DataODE(:,5)),'c','linewidth',2);


set(gca, 'linewidth', 2)
%set(gca,'xtick',[0:3],'xticklabel',[0:3]);

ylabel('Average signals (a.u.)','fontsize',20); 
%xlabel=('TNF-\alpha')

xl=xlabel({'t (h)'},'fontsize',20);
set(gca,'Fontsize',20)
axis([0 3 -0.1 1.1])



