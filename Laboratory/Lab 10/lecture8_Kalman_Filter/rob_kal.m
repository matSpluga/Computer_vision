function rob_kal(a1,b1,a2,b2)
%run: rob_kal(1,-6,1,2)
%wall1 a1x+b1y=0
%wall2 a2x+b2y=0
%Kalman example: a mobile robot
%%%%%%%%%%%%%%%%%%%%%%

meas_noise = 0.03;                        %measure noise (std dev)
proc_noise = 0.001;                       %process noise (std dev)
Dt=0.04;                                  %time step
PHI=eye(2,2);                             %transition matrix
theta= - 0.52; vel=5; 
x =[-0.8; -1];  x0=x;                     %initial state vector
xhat = [1;-3];xhat0=xhat;                 %initial estimation
Q1 = proc_noise^2 * (eye(size(PHI)));     %process noise correlation
kn = 100*meas_noise^2 * (eye(size(PHI))); %error estimate covariabec
Q2 = meas_noise^2 * (eye(size(PHI)));     %autocorrelation of the measure noise
alpha = zeros(size(x));                   %innovation process
%     
%a1=1; b1=1;
C=[ a1/sqrt(a1^2 +b1^2), b1/sqrt(a1^2 +b1^2)];  %measure matrix (distance from the first wall)
%a2=1; b2=1;  %coefficients of wall2
C(2,:)=[ a2/sqrt(a2^2 +b2^2), b2/sqrt(a2^2 +b2^2)]; %measure matrix (distance from the second wall)
%%
Itera =100; %number of iteration

%to store all the iterations
X=zeros(length(x),Itera); XHAT=zeros(length(x),Itera) ; XA=zeros(length(x),Itera) ;Y=zeros(length(x),Itera); 
NIS=zeros(1,Itera); SNIS=zeros(1,Itera); aSNIS=zeros(1,Itera); KN=zeros(length(x),length(x),Itera);
ALPHA=zeros(length(x),Itera);

inn= [vel*cos(theta);vel*sin(theta)]*Dt;   %model
%inn= [vel*cos(theta-pi/3);vel*sin(theta)]*Dt;   %wrong model
inna= [vel*cos(theta);vel*sin(theta)]*Dt;  %actual model of the robot

%%
xa=x; %actual initial position of the robot
randn('state',1);

for ii=1:Itera    
      x = PHI * x + inn + sparse(proc_noise * randn(length(x),1));    %process equation
 
      xa = PHI * xa + inna + sparse(proc_noise * randn(length(x),1)); %actual update of the state of the robot (not an estimation!)
      y = C * xa + sparse(meas_noise * randn(length(x),1));	      %measurement equation (read the actual state of the robot)
      xhat_apr=PHI * xhat + inn;                      %a priori estimate
      K = PHI * kn * PHI' + Q1 ;                      %a priori error covariance estimate
      alpha = y - C * xhat_apr; 				      %innovation process
      SIGMA = C * K * C' + Q2; 					      %innovation covariance
      invSIGMA=sparse(inv(SIGMA));
      G = K * C' * invSIGMA;    				      %Kalman gain
      xhat = xhat_apr + G * alpha; 				      %a posteriori estimate
      kn = K - G * C * K;       				      %a posteriori error covariance estimate
    % 

    %store the results
    X(:,ii)=x;
    Y(:,ii)=y;
    XHAT(:,ii)=xhat;
    XA(:,ii)=xa;
    ALPHA(:,ii)=alpha;
    KN(:,:,ii)=kn;
    
    NIS(:,ii)=alpha' * invSIGMA * alpha; 			      %normalized innovation squared NIS
    if ii>3, SNIS(:,ii)=NIS(:,ii-2) + NIS(:,ii-1) + NIS(:,ii);end     %summed normalized innovation squared SNIS
end

%%
for ii=3:Itera
    [U,S,V] = svd(KN(:,:,ii)); %singular values of the error covariance matrix
    s1(ii)=S(1,1);
    s2(ii)=S(2,2);
end

N2=2;
DOF=N2;% 

MM = chi2inv(0.95,DOF);

figure
subplot(2,2,1), plot([x0(1,1), X(1,:)],[x0(2,1),X(2,:)],'k:')
hold on
plot([xhat0(1,1),XHAT(1,:)],[xhat0(2,1),XHAT(2,:)],'r')
plot([x0(1,1),XA(1,:)],[x0(2,1),XA(2,:)],'k','LineWidth',2)
plot(xhat0(1,1),xhat0(2,1),'+k')
plot(x0(1,1),x0(2,1),'ok')
x=-2:2/32:2;  
plot(x,-(a1/b1)*x,'k-','LineWidth',3),plot(x,-(a2/b2)*x,'k-','LineWidth',3)
axis([-2 2 -4 0]),title('Environment map (x :; xa -; xhat r)'),xlabel('x (meters)'),ylabel('y (meters)'),hold off


subplot(2,2,3),plot(sqrt(s1),'k-'),hold on,plot(sqrt(s2),'k:'),hold off,title('Singular values')
xlabel('# of iterations')

subplot(2,2,4),plot(squeeze(SNIS),'k'),hold on
line([3 Itera],[7.2,7.2],'Color',[0 0 0]), title('SNIS'),text(10,10,'95%')
xlabel('# of iterations')

subplot(2,2,2)
for tmpn=2:10%2:5:55;
    tmpx=diag(KN(1:N2,1:N2,tmpn),0); 
    if tmpn==2
        zzz=max(1/max(max(sqrt(tmpx))));
    end 
    www=zzz*sqrt(tmpx(1)); hhh=zzz*sqrt(tmpx(2));  
    h=rectangle('Position',[XHAT(1,tmpn)-www/2,(XHAT(2,tmpn) -hhh/2),www,hhh],'Curvature',[1 1]);
end
box on,title('Uncertainty of state estimate')
xlabel('1^{st} component of the state'),ylabel('2^{nd} component of the state')
axis equal,text(x0(1),x0(2),'# of iterations')