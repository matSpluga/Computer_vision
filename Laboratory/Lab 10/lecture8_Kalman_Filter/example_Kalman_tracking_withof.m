%%%measure: coordinates
%%%state: coordinates + optic flow

clear all,close all;

load('data_track.mat')
%%%coord -> manually labeled feature
%%%im -> a sequence of images
%%%O ->  a sequence of optic flow maps

%%% we change the value of the 7th value to mimick a tracking error
coord(7,1)=550;
coord(7,2)=320;

%visualization
for ii=1:9
    im(round(coord(ii,2))-5:round(coord(ii,2))+5, round(coord(ii,1))-5:round(coord(ii,1))+5,ii)=0;
    figure, imagesc(im(:,:,ii)),colormap gray
    title('Measured coordinates (black)')
    pause
end

%%%build measure vector
for it=1:9
    d(1,it)=coord(it,1);%labeled feature
    d(2,it)=coord(it,2);%labeled feature
    d(3,it)=-[O(coord(it,2),coord(it,1),1,1)];%optic flow
    d(4,it)=-[O(coord(it,2),coord(it,1),2,1)];%optic flow
end

%KF initialization
meas_noise=0.1; %measure noise = 0.1 -> measures are noisy, trust more in the model
proc_noise = 0.008; %process noise = 0.008 -> measures are noisy, trust more in the model
%meas_noise=0.01; %measure noise = 0.01 -> measures are reliable, trust more in measures
%proc_noise = 0.8; %process noise = 0.8 -> trust more in measures

xhat=zeros(4,1);%initial estimation
Q1=proc_noise^2*eye(4,4);%process noise correlation
kn=100*meas_noise^2*eye(4,4);%error estimate covariance
Q2=meas_noise^2*eye(2,2);%autocorrelation of the measure noise
alpha=zeros(4,1);%innovation
PHI=[1 0 1 0;0 1 0 1; 0 0 1 0; 0 0 0 1];%transition matrix
H=[1 0 0 0;0 1 0 0];%measurement matrix

%KF
for it=1:9
    ynoise=H*d(:,it); %measurement equation
    xhat_apr=PHI*xhat;%a priori estimate
    K=PHI*kn*PHI'+Q1;%a priori error covariance estimate
    alpha=ynoise-H*xhat_apr;%innovation process
    SIGMA=H*K*H'+Q2; %innovation covariance
    invSIGMA=inv(SIGMA);
    G=K*H'*invSIGMA;%Kalman gain
    xhat=xhat_apr+G*alpha;%a posteriori estimate
    kn=K-G*H*K; %a posteriori error covariance estimate
    xx(it,:)=xhat;
    %%% xx are the filtered (estimated) coordinates
end

%visualization
for ii=1:9
    im(round(coord(ii,2))-5:round(coord(ii,2))+5, round(coord(ii,1))-5:round(coord(ii,1))+5,ii)=0;
    im(round(xx(ii,2))-5:round(xx(ii,2))+5, round(xx(ii,1))-5:round(xx(ii,1))+5,ii)=255;
    figure, imagesc(im(:,:,ii)),colormap gray
    title('Estimated coordinates (white)')
    pause
end


