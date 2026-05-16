function [ZE1,dnew]=Reconfig(d)
global busdt datas
d;
nbranch=length(d(:,1));
nnode=length(busdt(:,1));
nn=max(max(d(:,2)), max(d(:,3)));

%to maintain radial nature
ran1=find(d(:,1) == 15);     %radial maintain
ran2=find(d(:,1) == 34);     %radial maintain

[m1 n1]=size(ran1);
[m2 n2]=size(ran2);
if(m1==0 & m2==0)
    ra1=1;
else
    ra1=0;
end

if (nbranch==32 & nn==33 & ra1==0)

bno=d(:,1);
se=d(:,2);  %sending end
re=d(:,3);  %receiving end
r=d(:,4);
x=d(:,5);
B=d(:,6);
CS=d(:,7);

Mf=1;     %main feeder
nf=1;
S=0;


% nnode=33;
stack=zeros(nnode-1,1);

lindatnew=zeros(nbranch,6);
for i=1:nnode
    for j=1:nbranch        
        if(i==se(j))            
            S=S+1;
            Adn(S)=re(j);
            Adb(S)=(j);
        end
        if(i==re(j))            
            S=S+1;
            Adn(S)=se(j);
            Adb(S)=(j);
        end
    end
    Mt(i)=S;
    if(i~=nnode)
        Mf(i+1)=Mt(i)+1;
    end
    Mf;
end
avail=0;
lineno=1; %number of rows added to new line data
for nff=1:nf    % 1 to number of feeders   
stackcount=1;
stack(stackcount,1)=nff;
while stackcount > 0
%        pause
    xx=stack(stackcount,1);
%     Mf(xx)
%     Mt(xx)
    stack(stackcount,1)=0;
    stackcount=stackcount-1;  
    for i=Mf(xx):Mt(xx) 
        for j=1:lineno
            
            lineno;           
            mf=Mf(xx);
            mt=Mt(xx);
            aaa=Adn(i);
            bbb=lindatnew(j,1);
            Adn;
            lindatnew  ;
            j  ;
           
           if(lineno==33)
               abc=1;
           else
               abc=0;
           end
           if(abc==1)
               al=aaa(1);
               bl=bbb;
               l=find(al==lindatnew(j,1));
               Si=size(l);              
           else
           end
           if (abc==1 & j==32 & Si==0)
               break
           end
           
           if Adn(i)==lindatnew(j,1)
                avail=1;               
                break
            else
                avail=0;                
            end            
        end
        Adn;
        lindatnew(j,1);
        avail;
        if avail==0
                renew=Adn(i);
                senew=xx;
            for cnt=1:nbranch
                if (se(cnt)==senew && re(cnt)==renew)||(re(cnt)==senew && se(cnt)==renew)
                    lindatnew(lineno,1)=senew;
                    lindatnew(lineno,2)=renew;
                    lindatnew(lineno,3)=r(cnt);
                    lindatnew(lineno,4)=x(cnt);
                    lindatnew(lineno,5)=B(cnt); 
                    lindatnew(lineno,6)=CS(cnt);                        
                    lineno=lineno+1;                        
                end
            end
            stackcount=stackcount+1;
            stack(stackcount,1)=renew;
        end
        lineno;           
    end
end
end
else
    dd=datas;
    dd(:,1)=[];
    lindatnew=dd(1:33,:);  %skip the population   
end
dnew=lindatnew;
ZE = find(dnew(:,1) == 0);
ZE1 = sum(ZE);




