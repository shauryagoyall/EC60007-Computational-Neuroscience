clear;
clc;

%% B and C Testing and Specific Mu
mu = 1; %change to 1 or 0.1 or any other value as needed
F = @(t,y) [mu*y(2);mu*(1-y(1)^2)*y(2)-y(1)/mu];
y0 = [1; 0]; %initial point
opts = odeset('stats','on');
%tic
%[t,y]=ode15s(F, [0 500], y0, opts);
%toc
tic
[t,y]=ode45(F, [0 500], y0); %0 to 500 is time range for solving. lower it for 1 and 0.1 
toc
%% D Routine to plot solutions
%change mu in legend acoordingly
subplot(1,2,1)
plot(y(:,1),y(:,2)/mu,'-'),title('Phase Plane'),legend('mu=100') %state variables are y and y'/mu
xlabel("y");
ylabel("y'/mu");
subplot(1,2,2)
plot(t,y(:,1)),title('Oscillatory Motion'),legend('mu=100')
xlabel("t");
ylabel("y");
