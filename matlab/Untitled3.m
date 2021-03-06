clear

% 常数设定

k1=13.7e-12;k2=7.0e-12;k3=16.8e-12;

E0=8.85e-12;

E1=18.5*E0; % E1 为平行方向介电常数

E2=8.5*E0; % E2 为垂直方向介电常数

preangle1=2.0;% 预倾角

preangle2=2.0;

d=6.0e-6; % 液晶盒厚度

dim=101; % 划分网格 100 层

omiga=1.9; % 松弛因子

voltage1=2; % 外加偏压 voltage=5

voltage2=5;

% 设定初值

theta1(1)=2.0*pi/180; % 转化为弧度，作为边界条件

theta2(1)=2.0*pi/180;

theta1(dim)=2.0*pi/180;

theta2(dim)=2.0*pi/180;

for i=2:dim-1 % 设定倾斜角的初值

theta1(i)=0;

theta2(i)=0;

end

for i=1:dim

volt1(i)=voltage1-voltage1*(i-1)/(dim-1);% 设定偏压的初值

volt2(i)=voltage2-voltage2*(i-1)/(dim-1);

phi1(i)=0.5*(i-1)*pi/(dim-1);% 设定扭曲角的初值

phi2(i)=0.5*(i-1)*pi/(dim-1);

end

for k=1:20000 % 迭代次数

for i=2:dim-1

% 确定系数

c11=k1*cos(theta1(i)).^2.0+k3*sin(theta1(i)).^2.0; % 确定 c1 即系数 f(theta) 的表达式

c12=k1*cos(theta2(i)).^2.0+k3*sin(theta2(i)).^2.0;

dc11=sin(2.0*theta1(i)).*(k3-k1); % c1 的导数 f'(theta) 的表达式

dc12=sin(2.0*theta2(i)).*(k3-k1);

c21=(k2*cos(theta1(i)).^2.0+k3*sin(theta1(i)).^2.0)*cos(theta1(i)).^2.0; % 确定 c2 即系数 g(theta) 的表达式

c22=(k2*cos(theta2(i)).^2.0+k3*sin(theta2(i)).^2.0)*cos(theta2(i)).^2.0;

dc21=sin(2.0*theta1(i)).*(k3*cos(2.0*theta1(i))-2.0*k2*cos(theta1(i)).^2.0);% c2 的导数 g'(theta) 的表达式

dc22=sin(2.0*theta2(i)).*(k3*cos(2.0*theta2(i))-2.0*k2*cos(theta2(i)).^2.0);

c41=E1*sin(theta1(i)).^2.0+E2*cos(theta1(i)).^2.0; % 确定 c4 即系数 x(theta) 的表达式

c42=E1*sin(theta2(i)).^2.0+E2*cos(theta2(i)).^2.0;

dc41=sin(2.0*theta1(i)).*(E1-E2);% c4 的导数 x'(theta) 的表达式

dc42=sin(2.0*theta2(i)).*(E1-E2);

% 确定未知量

% 利用松弛因子，下次计算的初值可以用下面公式求得

%theta(i,n)=theta(i,n)+omiga*(theta(i,n)-theta(i,n-1))

theta1(i)=(1-omiga)*theta1(i)+omiga*((2.0*c11.*(theta1(i+1)+theta1(i-1))+dc11.*(theta1(i+1)-theta1(i-1)).^2.0/4.0-dc21.*(phi1(i+1)-phi1(i-1)).^2.0/4.0+dc41.*(volt1(i+1)-volt1(i-1)).^2.0/4.0)./(4.0*c11));

phi1(i)=(1-omiga)*phi1(i)+omiga*((c21.*(phi1(i+1)+phi1(i-1))+dc21.*(theta1(i+1)-theta1(i-1)).*(phi1(i+1)-phi1(i-1))./4.0)/(2.0*c21));

volt1(i)=(1-omiga)*volt1(i)+omiga*((c41.*(volt1(i+1)+volt1(i-1))+dc41.*(theta1(i+1)-theta1(i-1)).*(volt1(i+1)-volt1(i-1))./4.0)/(2.0*c41));

theta2(i)=(1-omiga)*theta2(i)+omiga*((2.0*c12.*(theta2(i+1)+theta2(i-1))+dc12.*(theta2(i+1)-theta2(i-1)).^2.0/4.0-dc22.*(phi2(i+1)-phi2(i-1)).^2.0/4.0+dc42.*(volt2(i+1)-volt2(i-1)).^2.0/4.0)./(4.0*c12));

phi2(i)=(1-omiga)*phi2(i)+omiga*((c22.*(phi2(i+1)+phi2(i-1))+dc22.*(theta2(i+1)-theta2(i-1)).*(phi2(i+1)-phi2(i-1))./4.0)/(2.0*c22));

volt2(i)=(1-omiga)*volt2(i)+omiga*((c42.*(volt2(i+1)+volt2(i-1))+dc42.*(theta2(i+1)-theta2(i-1)).*(volt2(i+1)-volt2(i-1))./4.0)/(2.0*c42));

end

end

h=linspace(0,d,dim);% 设定步进长度

y1=[theta1*180/pi];

y2=[phi1*180/pi];

plot(h,y1),figure;% 绘制图形

plot(h,y2);