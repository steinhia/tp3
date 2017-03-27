function [p,Q,A,DL]=resout_syst(DL,A,L,Q,D,b,n)
for i=1:n
    for j=1:n
        if L(i,j)~=0
            DL(i,j)=D(i,j)/L(i,j);
        end
    end
end

% calcul de la matrice A
for i=1:n
    for j=1:n
        if (i==j)
            A(i,j)=0;
            for k=1:n 
                if i~=k
                    A(i,j)=A(i,j)+DL(i,k);
                end
            end
        else
            A(i,j)=-DL(i,j);
        end
    end
end


% on vérifie si le système est inversible
detA=det(A);

%Comme le déterminant est nul, on change une ligne de la matrice
for i=1:n
    A(2,i)=0;
end
A(2,n)=1;

% on vérifie que le déterminant est non nul cette fois
detA=det(A);

%puis on résout le système
p=pinv(A)*b;

% on calcule ensuite les Qij correspondants

for i=1:n
    for j=1:n
        Q(i,j)=DL(i,j)*(p(i)-p(j));
    end
end