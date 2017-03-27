function res=bio(n)

N=1;
b=zeros(n,1);
DL=zeros(n,n);
A=zeros(n,n);
Q=zeros(n,n);
dD=zeros(n,n);
g=0.5; % gd = fait diverger
alpha=1.5;
step=4;
% initialisation de Q0
Q0=1;

% initialisation de D
for i=1:n
    for j=1:n
        D(i,j)=1;%rand()/2;
    end
end

%à une constante près, on fixe donc pn
pn=0;

for i=1:n
    for j=1:n
        L(i,j)=0;
    end
end
%initialisation de L
L(1,3)   =  7;
L(3,5)   = 16.5;     
L(3,4)   =  1;
L(4,5)   = 14.425;   
L(4,14)  =  7;
L(5,6)   =  1;
L(6,7)   =  3;
L(7,8)   = 15.164;   
L(7,16)  = 12;
L(16,17) =  3;
L(16,18) =  1;
L(18,19) =  0.5;
L(18,20) =  1;
L(20,21) =  0.5;
L(20,22) =  4;
L(6,9)   =  1.5;
L(9,10)  = 14.5;
L(10,11) =  1.5;
L(11,8)  =  1.5;     
L(9,12)  =  4;
L(10,23) =  3;
L(11,13) =  1;
L(8,15)  =  1.5;
L(2,15)  =  3;

for i=1:n
    for j=1:n
        if L(i,j)~=0 
            L(j,i)=L(i,j);
        end
    end
end



% calcul de la matrice b

b(1)=Q0;
b(2)=-Q0;

while N<100 % début de l'itération -> quand N<10 : état stationnaire
    [p,Q,A,DL]=resout_syst(DL,A,L,Q,D,b,n);

for i=1:n
    for j=1:n
        dD(i,j)=0;
    end
end

for i=1:step
for i=1:n
    for j=1:n
        if DL(i,j)~=0
            dD(i,j)=alpha*abs(Q(i,j))-g*D(i,j);
            D(i,j)=D(i,j)+dD(i,j);
            DL(i,j)=D(i,j)/L(i,j);
        end
    end
end
end
%N=norm(dD,1);
N=N+1;
end % état stationnaire, on sort de la boucle

% on calcule une dernière fois les Qij
[p,Q,A,DL]=resout_syst(DL,A,L,Q,D,b,n);
a=0;






