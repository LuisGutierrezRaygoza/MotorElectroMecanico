iniciales = [0 0 0];
tInicial = 0;
tFinal = 10;
paso = .00001;
tiempo = [tInicial:paso:tFinal];


[t,x] = ode45(@ElectroMecanico,tiempo,iniciales);
figure(1)
plot(t,x(:,1));
grid on
xlabel("Tiempo");

figure(2)
plot(t,x(:,3))
grid on
xlabel("Tiempo");

function dx=ElectroMecanico(t,x)
     Ra = 2;
     Kt = 0.01;
     b = 0.0012;
     La = 0.023;
     Ke = 0.01;
     J = 0.001;

     Vi = 6;
     dx= zeros(3,1);

     dx(1)=(1/La)*((-x(3)*Ke)+(-Ra*x(1))+Vi);
     dx(2)=x(3);
     dx(3)=(1/J)*((-b*x(3))+(Kt*x(1)));
 end