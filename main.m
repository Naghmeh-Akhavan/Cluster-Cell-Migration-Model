function main()
% For changing the parameters, please refer to the initial_setup() function
% Refer to readme.md for more information
%
% By Naghmeh Akhavan 2024

d = initial_setup();
x = d.x;

% Solve the ODE for motion of cluster
[t,u]=ode45(@odefun,d.T,22.355);
[~,u_alt]=ode45(@odefun,d.T_fine,22.355);


%% Plotting

% Plot the position of the cluster vs time
figure(1)
plot(u,t/60, 'k', linewidth=3), hold on 
xlabel('Position of cluster (\mum)', 'FontWeight','bold','fontsize',30), 
ylabel('Time (min)', 'FontWeight','bold','fontsize',30);
plot(d.x1*ones(size(u)),t/60,'b-.',d.x2*ones(size(u)),t/60,'b-.')
plot(d.x3*ones(size(u)),t/60,'r-.',d.x5*ones(size(u)),t/60,'r-.')
set(gca, 'FontSize', 16);
plot(d.p, d.T_alt/60,'r.','MarkerSize',25)

% Plot the velocity of the cluster vs position
figure(2)
plot(u_alt(1:end-1),diff(u_alt)/(0.05*5), "color","blue", 'linewidth',5),hold on   %velocity/position + data points
plot(d.p(1:end-1),d.spd, 'r.', 'MarkerSize',25)  %data points
ylabel('Velocity of cluster (\mum/min)', 'FontWeight','bold','fontsize',30), 
xlabel('Position of cluster (\mum)', 'FontWeight','bold','fontsize',30)

% Plot the concentration of chemoattractant
figure(3)
plot(d.x,concentration(d.x),'k','linewidth',2)
S=plot(d.x.*(d.x<=d.x1), concentration(d.x).*(d.x<=d.x1), 'b*', ...
      d.x.*(d.x>d.x1).*(d.x<=d.x0), concentration(d.x).*(d.x>d.x1).*(d.x<=d.x0), 'g*',...
      d.x.*(d.x>d.x0).*(d.x<=d.x2), concentration(d.x).*(d.x>d.x0).*(d.x<=d.x2), 'r*',...
      d.x.*(d.x>d.x2).*(d.x<=d.x3), concentration(d.x).*(d.x>d.x2).*(d.x<=d.x3), 'b*',...
      d.x.*(d.x>d.x3).*(d.x<=d.x4), concentration(d.x).*(d.x>d.x3).*(d.x<=d.x4), 'g*',...
      d.x.*(d.x>d.x4).*(d.x<=d.x5), concentration(d.x).*(d.x>d.x4).*(d.x<=d.x5), 'r*',...
      d.x.*(d.x>d.x5), concentration(d.x).*(d.x>d.x5), 'b*');, hold on
set(S, 'LineWidth',3, 'MarkerSize',10);
xlabel('Position: x (\mum)','fontsize',20), 
ylabel('Concentration: c(x)','fontsize',20)
axis([0 d.L 0 max(concentration(d.x))])
set(gca,'fontsize',20)   

% Plot the gradient of chemoattractant
figure(4)
Q=plot(x(1:end-1),diff(concentration(x)),'k*');
hold on
set(Q, 'LineWidth',3, 'MarkerSize',5);
xlabel('Position: x (\mum)'), 
ylabel('Gradient of Chemoattractant: \nabla c(x)','fontsize',20)
plot(d.x1*ones(size(x(1:end-1))),diff(concentration(x)),'b-.',d.x2*ones(size(x(1:end-1))),diff(concentration(x)),'b-.')
plot(d.x3*ones(size(x(1:end-1))),diff(concentration(x)),'r-.',d.x5*ones(size(x(1:end-1))),diff(concentration(x)),'r-.')
set(gca,'fontsize',20), hold on

function dudt=odefun(~,u)
% ODE function for the motion of the cluster

   d = initial_setup();
   s = d.ode_s;
   a = d.a;
   new_l = d.new_l;
   r = d.r;

   new_s = @(x) (x./(x+a));
   rho=@(x) (s*new_s(x).*x.^2)./(x.^2+new_l);            % receptor dynamic

   dudt=rho(concentration(u+r))-rho(concentration(u-r));
end % odefunction
end % main function
