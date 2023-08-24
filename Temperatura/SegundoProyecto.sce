//Definimos constantes de la letra
k = 0.6
A = 16
d = 0.25
c = 1012
r = 1
Tamb = 283
m = 76.8
vo = 100
a = 0.0035
w = 0.02
//Definimos constantes de la ecuación
const1 = 1/(r * m * c)
const2 = (-5 * k * A)/(d * m * c)
//Definimos condiciones iniciales
t(1) = 0
V(1) = vo
T(1) = Tamb
deriv(1) = 0 //Derivada de T en funcion del tiempo
dt = 0.1
//Condiciones iniciales partes e y f
ee = 0
ef = 0

//Aplicamos Euler sobre la ecuacion hallada en la parte a
for k=2:1:36000
   t(k) = t(k-1) + dt
   V(k) = V(1) * (1 - (%e^(-a*t(k)))*(cosd(w*t(k))))
   T(k) = T(k-1) + deriv(k-1)*dt
   deriv(k) = const1*((V(k))^2) + const2*(T(k)-Tamb)
   //Parte e
   if t(k)<24831 // Si el tiempo es menor a ti
       ee = ee + V(k)^2/r * dt
   end
   //Parte f
   if T(k)<295 // Si el tiempo es menor a ti
       ef = ef + V(k)^2/r * dt
   end
end
//Graficamos
scf(1)
plot(t,T,"-g")
xlabel('Tiempo (s)')
ylabel('Temperatura (K)')
title('Gráfico de temperatura en función del tiempo')

//Parte d
[i] = find(T>334.56,1)
ti = i // Tiempo t infinito
disp("Valor del tiempo pedido en la parte d): " + string(ti) + " s")
//Parte e
ee = ee * 2.778*10^-7
disp("Valor de la energía pedida en la parte e): " + string(ee) + " kW-h")
//Parte f
ef = ef * 2.778*10^-7
disp("Valor de la energía pedida en la parte f): " + string(ef) + " kW-h")
