clc
clearvars
%matriz finita de flexion
l = 1.25;
E = 6*(10^8);
a = 0.1
%b = 0.1
I = (a^4)/12;
%M = 40000;
m = 200;
%syms l
l1 = 0.5
l2 = 0.75
k1 = [12 6*l1 -12 6*l1 0 0;6*l1 4*l1*l1 -6*l1 2*l1*l1 0 0;-12 -6*l1 12 -6*l1 0 0;6*l1 2*l1*l1 -6*l1 4*l1*l1 0 0;0 0 0 0 0 0;0 0 0 0 0 0]
k2 = [0 0 0 0 0 0;0 0 0 0 0 0;0 0 12 6*l2 -12 6*l2;0 0 6*l2 4*l2*l2 -6*l2 2*l2*l2;0 0 -12 -6*l2 12 -6*l2;0 0 6*l2 2*l2*l2 -6*l2 4*l2*l2]
%k2r = k2/8;
K =  (k2/27) + (2*k1)
ext = 25*5*E*I/(l^3)
KK = ext*K
m1 = 156
m2 = 58.5
MM = [m1/2 0 0 0 0 0;0 0 0 0 0 0;0 0 (m1+m2)/2 0 0 0;0 0 0 0 0 0;0 0 0 0 m2/2 0;0 0 0 0 0 0]
syms ddy1 ddy2 ddy3 ddy4 ddy5 ddy6  y2 y6 y3 y4
y1 = 0
y5 = 0
vec_y = [y1;y2;y3;y4;y5;y6];
%vec_y = [y1;y6;y3;y4;y1;-y6];
vec_ddy = [ddy1;ddy2;ddy3;ddy4;ddy5;ddy6];
funciones1 = K*vec_y %recuerda que esto es sin ext
%y est
F = 1000%juerza
om =10
m = 300
k = 590178
w = sqrt(k/m)
Fest = (F/k)/abs(1-((om/w)^2))
%arreglo
Ka = [24-(24*3/7),6-(24*3/7);6-(24*3/7),1.72]
Kr = ext*Ka
Mr = [5000 0;0 40250]
om1 = 50
om2 = 70
met1 = [-(om1^2)*Mr + Kr]
met2 = [-(om2^2)*Mr + Kr]
F1 = [500;0];
res1 = inv(met1)*F1
F2 = [0;1000];
res2 = inv(met2)*F2
x5 =  abs(res1(2,1))+abs(res2(2,1))