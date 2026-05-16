function [y] = indices(X,N,dim)

global datas busdt basemva
[Pl] = withoutDG();

e = busdt();
d = datas();
X;
m1=length(X(:,1));
Tonode = d(:,1);

for i=1:N
    for j=1
        e = busdt();
        d = datas();
        X(i,:);
        
        l = find(Tonode == X(i));       %to find the number
        d(l,1:7)= 0;
        
        l = find(Tonode == X(i,j+1));   %to find the number
        d(l,1:7)= 0;
        
        l = find(Tonode == X(i,j+2));   %to find the number
        d(l,1:7)= 0;  
                 
        l = find(Tonode == X(i,j+3));   %to find the number
        d(l,1:7)= 0; 
                 
        l = find(Tonode == X(i,j+4));   %to find the number
        d(l,1:7)= 0;   
        
%         % to select the first sub feeder   
        l = find(Tonode == X(i,j+5));   %to find the number
        e(l,2)=e(l,2)+(0.975);                %inject load of 1500 kw EVCS1
        
%         % to select the second sub feeder
        l = find(Tonode == X(i,j+6));   %to find the number
        e(l,2)=e(l,2)+(0.975);                %inject load of 1500 kw EVCS2
        
%         % to select the second sub feeder
        l = find(Tonode == X(i,j+7));       %to find the number
        e(l,3)=e(l,3)-(X(i,j+11))/1000;     %convert KVAR into MVAR inject load of Cap1
        
%         % to select the second sub feeder
        l = find(Tonode == X(i,j+8));       %to find the number
        e(l,3)=e(l,3)-(X(i,j+12))/1000;     %convert KVAR into MVAR inject load of Cap2
        
%         % to select the second sub feeder
        l = find(Tonode == X(i,j+9));       %to find the number
        e(l,3)=e(l,3)-(X(i,j+13))/1000;     %convert KVAR into MVAR inject load of Cap3
        
%         % to select the second sub feeder
        l = find(Tonode == X(i,j+10));      %to find the number
        e(l,3)=e(l,3)-(X(i,j+14))/1000;     %convert KVAR into MVAR inject load of Cap4      
        
        TC = (X(i,j+11))+(X(i,j+12))+(X(i,j+13))+(X(i,j+14));
        
        row=find(d(:,1)>0);
        d=d(row,:);
    end
    e
    d
         
    [Pldg SIdg IVd Ic] = DG(d,e);
    
    PLDG(i,1) = Pldg*100*1000   %Power is convert into KW 
    
    %Total Capacitor
    TC1(i,1) = TC
        
    %Energy Loss Reduction benefit
%     ELR(i,1) = 0.06*(202.68-PLDG(i,1))*8760
    ELR(i,1) = 0.06*(202.68-PLDG(i,1))*8760    
    
    %Installation cost of system components
    ICC(i,1) = 0.2*(1400*4+6070*2+25*TC1(i,1))
%     ICC(i,1) = 0.2*(1400*4+1600*2+25*TC1(i,1))
%     ICC(i,1) = 0.2*(1400*4)
    
    %Operating cost of system components
%     OC  = 300*1+800*2
    OC  = 300*4+800*2    
    
    ILP(i,1) = Pldg/Pl;  
            
    VSI(i,1) = min(SIdg);    
    
    %Line flow limit index is maintain the value below one 
    IC(i,1)=max(Ic);
    
     %voltage limit is to be maintained
    IVD(i,1) = max(IVd);
    
    
    % Rate of Energy cost is maintained higher than the Inst.and Oper.cost
 
%     if(ELR(i,1)>ICC(i,1)+OC)
%         ELR(i,1)=ELR(i,1);
%     else
%         ELR(i,1)=100;
%     end
    
    %Net Profit
    NP(i,1) = ELR(i,1)-ICC(i,1)-OC;
    
%     if(NP(i,1)>0)
%         NP(i,1)=NP(i,1);
%     else
%         NP(i,1)=0;
%     end
    NP(i,1);
    NetProfit=NP(i,1)
    pause
            
    y(i,1)=0; 
    
%     y(i,1) = y(i,1)+0.5*ILP(i,1)+0.4*IVD(i,1)+0.1*(1/VSI(i,1)); 
 
%     y(i,1) = y(i,1)+ NP(i,1)+IIC(i,1)+IIVD(i,1); 
 y(i,1) = y(i,1)+ NP(i,1);   %+IIC(i,1)+IIVD(i,1);   
  
end
ILP;
PL;
VSI;
IC;
IVD;
y;

    



