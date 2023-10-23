%Дано
w = 1000;
R2 = 40;
C2 = 25 * 1e-6;
R3 = 40;
C4 = 25 * 1e-6;
R5 = 60;
C5 = 33.3 * 1e-6;
L6 = 40 * 1e-3;

%Вычисление комплексного ЭДС
t = sqrt(2);
E1 = (905.5/t) *( cos(0.896) + i*sin(0.896));
E2 = (559.5/t)*(cos(3.423) + i * sin(3.423));
J3 = (9.1/t)*(cos(2.467) + i * sin(2.467));
E6 = (733.9/t)*(cos(4.275) + i * sin(4.275));
%Вычисление комплексного сопротивления
Z1 = 0;
Z2 = R2 - i * (1 / (w * C2));
Z3 = inf;
z3 = R3;
Z4 = -i * (1 / (w * C4));
Z5 = R5 - i * (1 / (w * C5));
Z6 = i * w * L6;
%Вычисление контурных токов
Z11 = Z2 + Z3 + Z6;
Z12 = -Z6;
Z21 = -Z6;
Z13 = Z2;
Z31 = Z2;
Z22 = Z4 + Z5 + Z6;
Z23 = Z5;
Z32 = Z5;
Z33 = Z2 + Z5;
%Вычисление контурных токов
Ik1 = J3;
A = [Z22 Z23; Z32 Z33];
B = [-E6 - Z21 * Ik1; E1 + E2 - Z31 * Ik1];
X = inv(A)*B;
lsqr(A, B);
Ik2 = X(1);
Ik3 = X(2);
%Вычисление токов схемы
I1 = Ik3;
I2 = Ik1 + Ik3;
I3 = Ik1;
I4 = Ik2
I5 = Ik2 + Ik3;
I6 = Ik1 - Ik2;
%Уравнение баланса мощностей
%Рассчитываем сопряженные токи, потому что должна быть звездочка!
I1c = real(I1) - i * imag(I1);
I2c = real(I2) - i * imag(I2);
I3c = real(I3) - i * imag(I3);
I6c = real(I6) - i * imag(I6);
%Рассчитываем мощность источника
U3 = I2*Z2 + I3*z3 + I6*Z6 - E2 - E6;
Ps = E1*(I1c) + E2*(I2c) + U3*(I3c) + E6*(I6c)
Pc = (real(I2)^2 + imag(I2)^2)*Z2 + (real(I3)^2 + imag(I3)^2)*z3 + (real(I4)^2 + imag(I4)^2)*Z4 + (real(I5)^2 + imag(I5)^2)*Z5 + (real(I6)^2 + imag(I6)^2)*Z6

%метод эквивалентного генератора
I5_ = (E1 + E2 - Z2*J3)/(Z5 + Z2);
Uxx = -E6 + J3*Z6 - I5_*Z5;
Ze = (Z2*Z5)/(Z5 + Z2) + Z6 + Z4;
I4_ = Uxx/Ze
 


