clear all;
n=10;
phi=pi/5;
beta=610/n;

A=2;

M=zeros(n,n);
for i=1:n
for j=1:n

if(i==j) 
M(i,j)=A*cos(2*pi*beta*i +phi);
end

if(i==j+1 || i==j-1)
M(i,j)=-1;
end

if(i==n && j==1 || j==n && i==1)
M(i, j)=-1;
end

end
end
[V, D] =eig(M); 
Y=V(:,1).^2;
X=1:n;
hold on
plot(X, Y,'r');
title('Mis graficos');
xlabel('i');
ylabel('|{\Psi}_{i}|^{2}');
