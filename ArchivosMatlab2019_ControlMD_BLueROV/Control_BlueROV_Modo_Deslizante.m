%% Andres Lopez y Daniel Gomez---------------------------------------------
clear all; clc; close all
disp('Datos_BlueRov')
%% DATOS-SUMINISTRADOS-----------------------------------------------------
m=7.31;xg=0;yg=0;zg=0;xb=0;yb=0;zb=0.00019;Ix=0.16;Iy=0.16;Iz=0.16;Ixy=0;
Ixz=0;Iyz=0;W=71.71;B=78.38;Xu=-4.03;Yv=-6.22;Zw=-5.18;Kp=-0.07;Mq=-0.07;
Nr=-0.07;Xudot=-5.5;Yvdot=-12.7;Zwdot=-14.57;Kpdot=-0.12;Mqdot=-0.12;
Nrdot=-0.12;Xuu=-18.18;Yvv=-21.66;Zww=-36.99;Kpp=-1.55;Mqq=-1.55;Nrr=-1.55;
lx1=0.153;ly1=-0.111;lz1=-0.004;lx2=0.153;ly2=0.111;
lz2=-0.004;lx3=-0.199;ly3=0;lz3=0.085;lx4=-0.016;ly4=0.111;
lz4=-0.014;lx5=-0.016;ly5=-0.111;lz5=-0.014;lx6=0.008;ly6=0;
lz6=0.095e-3;Cmax1=3.33e-4;Cmax2=3.33e-4;Cmax3=2.24e-4;Cmax4=2.41e-4;
Cmax5=2.41e-4;Cmax6=2.43e-4;Cmin1=3.68e-4;Cmin2=3.68e-4;Cmin3=2.27e-4;
Cmin4=1.75e-4;Cmin5=1.75e-4;Cmin6=2.29e-4;
%------------Masas---------------------------------------------------------
Mrb=[   m,     0,     0,     0,  m*zg, -m*yg;...%Matriz de inercia
        0,     m,     0, -m*zg,     0,  m*xg;...
        0,     0,     m,  m*yg, -m*xg,     0;...
        0, -m*zg,  m*yg,    Ix,  -Ixy,  -Ixz;...
     m*zg,     0, -m*xg,  -Ixy,    Iy,  -Iyz;...
    -m*yg,  m*xg,     0,  -Ixz,  -Iyz,   Iz];
Fmomento=[Xudot,Yvdot,Zwdot,Kpdot,Mqdot,Nrdot];%momento
Ma=-diag(Fmomento);%masa adicional

M= Mrb+Ma;%Matriz de masa total 
Minv=inv(M);
%--------------------------------------------------------------------------
eta=1;
a0=100;
a1=20;