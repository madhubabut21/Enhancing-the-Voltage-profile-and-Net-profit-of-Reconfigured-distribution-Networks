%%% Chaotic Honey Badger Algorithm %%% 
function [Xprey, Food_Score,CNVG] = CHBA(dim,lb,ub,tmax,N)
beta     = 6;     
C        = 2;     
vec_flag = [1,-1];

%initialization
for i=1:N
    for j=1:dim
        X(i,j)=0;
        X(i,j)=round(lb(j)+rand(1)*(ub(j) - lb(j)));
    end
%     while (X(i,1)==X(i,2))
%         X(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%     end
%     while (X(i,1)==X(i,3))
%         X(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%     end  
    
    for j=7         % to select the second sub feeder
        X(i,j);
        if(X(i,j)>2 && X(i,j)<19)
            X(i,j)=22;
        else
            X(i,j)=X(i,j);
        end        
    end
%     for j=3         % to select the third sub feeder
%         X(i,j);
%         if(X(i,j)>3 && X(i,j)<23)
%             X(i,j)=25;
%         else
%             X(i,j)=X(i,j);
%         end        
%     end   
end
    for j=1:dim
        if X(i,j)>ub(j)
            X(i,j)=ub(j);
        end
    end
% X = [33 34 35 36 37   2 19   22 28 16 21   0   0   0   0]  %basecase 
X = [9 32 7 14 37   2 19   15 11 24 30  248 166 352 858]  %NR,EVCS,Cap
[fitness] = indices(X,N,dim);

[GYbest, gbest] = max(fitness);
Xprey = X(gbest,:);

for t = 1:tmax
    alpha=C*exp(-t/tmax);   
    I=Intensity(N,Xprey,X); 
    for i=1:N
        r =rand();
        F=vec_flag(floor(2*rand()+1));
        for j=1:1:dim
            di=((Xprey(j)-X(i,j)));
            if r<.5
                r3=rand;                r4=rand;                r5=rand;
                Xnew(i,j)=Xprey(j) +F*beta*I(i)* Xprey(j)+F*r3*alpha*(di)*abs(cos(2*pi*r4)*(1-cos(2*pi*r5)));
            else
                r7=rand;
                Xnew(i,j)=Xprey(j)+F*r7*alpha*di;
            end
        end        
                        
        FU=Xnew(i,:)>ub;
        FL=Xnew(i,:)<lb;
        Xnew(i,:)=(Xnew(i,:).*(~(FU+FL)))+ub.*FU+lb.*FL;
        
        Xnew=round(Xnew);
        
%         while (Xnew(i,1)==Xnew(i,2))
%             Xnew(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%         end
%         while (Xnew(i,1)==Xnew(i,3))
%             Xnew(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%         end

        for j=7        % to select the second sub feeder
            Xnew(i,j);
            if(Xnew(i,j)>2 && Xnew(i,j)<19)
                Xnew(i,j)=22;
            else
                Xnew(i,j)=Xnew(i,j);
            end
        end
        
        for j=1:dim
            if Xnew(i,j)>ub(j)
                Xnew(i,j)=ub(j);
            end
        end
        
        
        
%         for j=3        % to select the third sub feeder
%             Xnew(i,j);
%             if(Xnew(i,j)>3 && Xnew(i,j)<23)
%                 Xnew(i,j)=25;
%             else
%                 Xnew(i,j)=Xnew(i,j);
%             end
%         end
           
        [tempFitness] = indices(Xnew,1,dim);
       
        if tempFitness>fitness(i)
            fitness(i)=tempFitness;
            X(i,:)= Xnew(i,:);
        end
    end
    
    FU=X(i,:)>ub;
    FL=X(i,:)<lb;
    X(i,:)=(X(i,:).*(~(FU+FL)))+ub.*FU+lb.*FL;
    
    X=round(X);
    
%     while (X(i,1)==X(i,2))
%         X(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%     end
%     while (X(i,1)==X(i,3))
%         X(i,1) = round(lb(j)+rand(1)*(ub(j) - lb(j)));
%     end

    for j=7            % to select the second sub feeder
        X(i,j);
        if(X(i,j)>2 && X(i,j)<19)
            X(i,j)=22;
        else
            X(i,j)=X(i,j);
        end
    end
    
    for j=1:dim
        if X(i,j)>ub(j)
            X(i,j)=ub(j);
        end
    end
      
    
%     for j=3            % to select the third sub feeder
%         X(i,j);
%         if(X(i,j)>3 && X(i,j)<23)
%             X(i,j)=25;
%         else
%             X(i,j)=X(i,j);
%         end
%     end
    
    [Ybest,index] = max(fitness);
    CNVG(t)=max(Ybest)    
    
    if Ybest>GYbest
        GYbest=Ybest;
        Xprey = X(index,:);
    end
end
Food_Score = GYbest;
end

function I=Intensity(N,Xprey,X)
for i=1:N-1
    di(i) =( norm((X(i,:)-Xprey+eps))).^2;
    S(i)=( norm((X(i,:)-X(i+1,:)+eps))).^2;
end
di(N)=( norm((X(N,:)-Xprey+eps))).^2;
S(N)=( norm((X(N,:)-X(1,:)+eps))).^2;
for i=1:N
    r2=rand;
    I(i)=r2*S(i)/(4*pi*di(i));
end
end
