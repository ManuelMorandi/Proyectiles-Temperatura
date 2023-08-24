clear();
//Ingresamos todos los datos
x(1)=0;
y(1)=0;
printf("Ingrese el valor de la velocidad inicial sin rozamiento");
vo = input('');
printf("Ingrese el valor del ángulo inicial sin rozamiento");
tita = input('');
g = 9.8;
vx(1)=vo*cosd(tita); //Genero condiciones iniciales
vy(1)=vo*sind(tita);
ax(1)= 0;
ay(1)= -g;

//PRIMERA PARTE
k = 1;
dt = 0.001;

//Numerico, parte b
while y(k)>=0
    ax(k+1)= ax(k)
    ay(k+1)= ay(k)
    vx(k+1)= vx(k)+ax(k)*dt
    vy(k+1)= vy(k)+ay(k)*dt
    x(k+1)= x(k)+vx(k)*dt
    y(k+1)= y(k)+vy(k)*dt
    k=k+1
end
t=[0:dt:(k-1)*dt]'

//Analitico, parte a
ya=y(1)+vy(1)*t +(ay(1)/2)*t^2 //Hallamos y en funcion del tiempo
xa=x(1)+vx(1)*t //Hallamos x en funcion del tiempo

//Alcance
alcance = x($) //$ es siempre el ultimo valor del vector

//Parte a
scf(1)
plot(xa,ya,"-r") //Graficamos y en función de x
xlabel('Posición horizontal (m)')
ylabel('Altura (m)')
title('Grafico de y(x) hallado de manera analítica')

//Parte b
scf(2)
plot(x,y,"+g") //Graficamos y en función de x
xlabel('Posición horizontal (m)')
ylabel('Altura (m)')
title('Grafico de y(x) hallado de manera númerica')

//Parte d
titan = 0;
alcanceAnt = 0;
alcanceMax = 0;
while alcanceMax >= alcanceAnt
    titan = titan + 0.5
    alcanceAnt = alcanceMax
    alcanceMax = 2*vo^2*sind(titan)*cosd(titan)/g
end
titan = titan - 0.5 //Vamos a sumar medio grado de mas en el while, se lo restamos

//Parte e
//GRAFICAR CON LOS ANGULOS DE C Y D
titaa = 45; //Angulo analitico de la parte c
vo = 40;
xn(1)=0;
yn(1)=0;
xa(1)=0;
ya(1)=0;
axn(1)=0;
ayn(1)=-g;
//Numerica
vxn(1)=vo*cosd(titan);
vyn(1)=vo*sind(titan);
k=1;
while yn(k)>=0
    axn(k+1)= axn(k)
    ayn(k+1)= ayn(k)
    vxn(k+1)= vxn(k)+axn(k)*dt
    vyn(k+1)= vyn(k)+ayn(k)*dt
    xn(k+1)= xn(k)+vxn(k)*dt
    yn(k+1)= yn(k)+vyn(k)*dt
    k=k+1
end
t=[0:dt:(k-1)*dt]'
scf(3)
plot(xn,yn,"+g")
xlabel('Posición horizontal (m)')
ylabel('Altura (m)')
title('Grafico de y(x) con angulos para alcance maximo')

//Analitica
vxa(1)=vo*cosd(titaa);
vya(1)=vo*sind(titaa);
yaa=y(1)+vya(1)*t +(ay(1)/2)*t^2 //Hallamos y en funcion del tiempo
xaa=xa(1)+vxa(1)*t
plot(xaa,yaa,"-r")


//SEGUNDA PARTE
//Parte a
x1(1)=0;
y1(1)=0;
x2(1)=0;
y2(1)=0;
printf("Ingrese el valor de la velocidad inicial con rozamiento");
vo = input('');
printf("Ingrese el valor del ángulo inicial con rozamiento");
tita = input('');
vx1(1)=vo*cosd(tita); //Genero condiciones iniciales
vy1(1)=vo*sind(tita);
vx2(1)=vo*cosd(tita); //Genero condiciones iniciales
vy2(1)=vo*sind(tita);
g=9.8;
p = 1.2;

m1=0.4;
r1=0.11; //Lo pasamos a metros
area1=%pi*r1^2; //Calculamos area
ax1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vx1(1)
ay1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vy1(1)-g
//Graficamos
k = 1;
dt = 0.001;
while y1(k)>=0
    ax1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vx1(k)
    ay1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vy1(k)-g
    vx1(k+1)= vx1(k)+ax1(k)*dt
    vy1(k+1)= vy1(k)+ay1(k)*dt
    x1(k+1)= x1(k)+vx1(k)*dt
    y1(k+1)= y1(k)+vy1(k)*dt
    k=k+1
end
t=[0:dt:(k-1)*dt]'
scf(4)
plot(x1,y1,-1,"color","red")

m2=0.03;
r2=0.01; //Lo pasamos a metros
area2=%pi*r2^2;
ax2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vx2(1)
ay2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vy2(1)-g
//Graficamos
k = 1;
dt = 0.001;
while y2(k)>=0
    ax2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vx2(k)
    ay2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vy2(k)-g
    vx2(k+1)= vx2(k)+ax2(k)*dt
    vy2(k+1)= vy2(k)+ay2(k)*dt
    x2(k+1)= x2(k)+vx2(k)*dt
    y2(k+1)= y2(k)+vy2(k)*dt
    k=k+1
end
t=[0:dt:(k-1)*dt]'
scf(4)
plot(x2,y2,-1)
title('Grafico de y(x) con rozamiento con el aire')
legend(["Objeto 1","Objeto 2"])


//Parte b

//Con el objeto 1, la pelota
clear(['x1' 'x2' 'y2' 'y1'])
titan1 = 0;
m1=0.4;
r1=0.11;
area1=%pi*r1^2;
p = 1.2;
vo = 40
g=9.8;
alcanceAnt1 = 0;
alcanceMax1 = 0;
b = 0
while alcanceMax1 >= alcanceAnt1
    titan1 = titan1 + 1
    vx1(1)=vo*cosd(titan1);
    vy1(1)=vo*sind(titan1);
    x1(1) = 0
    y1(1) = 0
    ax1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vx1(1)
    ay1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vy1(1)-g
    k = 1
    alcanceAnt1 = alcanceMax1
    dt = 0.001;
    while y1(k)>=0
        ax1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vx1(k)
        ay1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vy1(k)-g
        vx1(k+1)= vx1(k)+ax1(k)*dt
        vy1(k+1)= vy1(k)+ay1(k)*dt
        x1(k+1)= x1(k)+vx1(k)*dt
        y1(k+1)= y1(k)+vy1(k)*dt
        k=k+1
    end
    t=[0:dt:(k-1)*dt]'
    alcanceMax1 = x1($)
end
t=[0:dt:(k-1)*dt]'
scf(5)
plot(x1,y1,+1,"color","red")
title('Grafico de y(x) con angulos para alcance maximo con rozamiento con el aire')

titan2 = 0;
m2=0.03;
r2=0.01;
area2=%pi*r2^2;
p = 1.2;
vo = 40
g=9.8;
alcanceAnt2 = 0;
alcanceMax2 = 0;
b = 0
while alcanceMax2 >= alcanceAnt2
    titan2 = titan2 + 1
    vx2(1)=vo*cosd(titan2);
    vy2(1)=vo*sind(titan2);
    x2(1) = 0
    y2(1) = 0
    ax2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vx2(1)
    ay2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vy2(1)-g
    k = 1
    alcanceAnt2 = alcanceMax2
    dt = 0.001;
    while y2(k)>=0
        ax2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vx2(k)
        ay2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vy2(k)-g
        vx2(k+1)= vx2(k)+ax2(k)*dt
        vy2(k+1)= vy2(k)+ay2(k)*dt
        x2(k+1)= x2(k)+vx2(k)*dt
        y2(k+1)= y2(k)+vy2(k)*dt
        k=k+1
    end
    t=[0:dt:(k-1)*dt]'
    alcanceMax2 = x2($)
end
t=[0:dt:(k-1)*dt]'
plot(x2,y2,+1)
legend(["Objeto 1","Objeto 2"])

//Parte c

//Objeto 1 numerico
x1(1)=0;
y1(1)=0;
vo = 40;
tita = 90;
vx1(1)=vo*cosd(tita);
vy1(1)=vo*sind(tita);
g=9.8;
p = 1.2;
m1=0.4;
r1=0.11;
area1=%pi*r1^2
ax1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vx1(1)
ay1(1)=-(1/2)*(p*area1/m1)*sqrt(vx1(1)^2+vy1(1)^2)*vy1(1)-g
k = 1;
dt = 0.001;
altMax1 = 0
tiempo1 = 0
while y1(k)>=0
    ax1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vx1(k)
    ay1(k+1)= -(1/2)*(p*area1/m1)*sqrt(vx1(k)^2+vy1(k)^2)*vy1(k)-g
    vx1(k+1)= vx1(k)+ax1(k)*dt
    vy1(k+1)= vy1(k)+ay1(k)*dt
    x1(k+1)= x1(k)+vx1(k)*dt
    y1(k+1)= y1(k)+vy1(k)*dt
    tiempo1 = tiempo1 + 0.001
    if y1(k+1)<y1(k) && altMax1==0
        altMax1 = y1(k)
        tiempoMax1 = tiempo1
    end
    k=k+1  
end
t=[0:dt:(k-1)*dt]'
scf(6)
plot(t,y1,-1)
title("Grafica de y(t) al tirar los objetos verticalmente con vo=40m/s")
//Objeto 1 analitico
vx1(1)=0
vy1(1)=40*sind(90)
ay1(1)=-g
x1(1)=0
y1(1)=0
t2=[0:dt:(k+1400)*dt]'
ya1=y1(1)+vy1(1)*t2 +(ay1(1)/2)*t2^2 
xa1=x1(1)+vx1(1)*t2
scf(6)
plot(t2,ya1,-1,"color","yellow") 

//Objeto 2 numerico
x2(1)=0;
y2(1)=0;
vo = 40;
tita = 90;
vx2(1)=vo*cosd(tita);
vy2(1)=vo*sind(tita);
g=9.8;
p = 1.2;
m2=0.03;
r2=0.01;
area2=%pi*r2^2
ax2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vx2(1)
ay2(1)=-(1/2)*(p*area2/m2)*sqrt(vx2(1)^2+vy2(1)^2)*vy2(1)-g
k = 1;
dt = 0.001;
altMax2 = 0
tiempo2 = 0
while y2(k)>=0
    ax2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vx2(k)
    ay2(k+1)= -(1/2)*(p*area2/m2)*sqrt(vx2(k)^2+vy2(k)^2)*vy2(k)-g
    vx2(k+1)= vx2(k)+ax2(k)*dt
    vy2(k+1)= vy2(k)+ay2(k)*dt
    x2(k+1)= x2(k)+vx2(k)*dt
    y2(k+1)= y2(k)+vy2(k)*dt
    tiempo2 = tiempo2 + 0.001
    if y2(k+1)<y2(k) && altMax2==0
        altMax2 = y2(k)
        tiempoMax2 = tiempo2
    end
    k=k+1  
end
t=[0:dt:(k-1)*dt]'
scf(6)
plot(t,y2,-1,"color","green")
//Objeto 2 analitico
vx2(1)=0
vy2(1)=40*sind(90)
ay2(1)=-g
x2(1)=0
y2(1)=0
t2=[0:dt:(k+1400)*dt]'
ya2=y2(1)+vy2(1)*t2 +(ay2(1)/2)*t2^2 
xa2=x2(1)+vx2(1)*t2
plot(t2,ya2,-1,"color","red")
legend(["Objeto 1 numerico","Objeto 1 analitico","Objeto 2 numerico","Objeto 2 analitico"]) 





