% This script solves a partial differential equation (PDE) representing 
% the concentration of a substance over time and space using the pdepe function.
%
% Inputs:
%       See parameters section below
% Outputs:
% concentration - Solution of the PDE representing concentration over space and time
%
% Plots:
%     Concentration profile at the final time step
% By Naghmeh Akhavan, January 2025

%% Parameters

params.D = 1;           % Diffusion coefficient
params.k = 0.00042;     % Reaction rate
params.rb = 0.18;       % Radius of the tube
params.c0 = 15;         % Initial concentration

params.x0=57.482;       % Position of the first gap
params.x4=111.96;       % Position of the second gap
params.xhat0=7.5;       % Width of the first gap
params.xhat4=10;        % Width of the second gap
params.b0=0.25279;      % 1st gap depth
params.b4=0.668666;     % 2nd gap depth

L = 200;                    % Length of the tube
x = linspace(0, L, 1e+3);   % Spatial grid
t = linspace(0, 1e+4, 40);  % Temporal grid

%% END Parameters

% Dependent parameters
params.a0 = (params.b0 - params.rb) / params.xhat0;
params.a4 = (params.b4 - params.rb) / params.xhat4;

params.x1 = params.x0 - params.xhat0;
params.x2 = params.x0 + params.xhat0;
params.x3 = params.x4 - params.xhat4;
params.x5 = params.x4 + params.xhat4;

%% Solve the PDE
% Impose parameters via anonymous functions
pdefun = @(x, t, c, dcdx) pdefuna(x, t, c, dcdx, params);
icfun = @(x) icfuna(x, params);
bcfun = @(xL, cL, xR, cR, t) bcfuna(xL, cL, xR, cR, t, params);
% Solve the PDE
sol = pdepe(0, pdefun, icfun, bcfun, x, t);


% Plot
figure
plot(x, sol(end, :), 'b','linewidth', 4); 
xlabel('Position (x) (\mum)');
ylabel('Concentration c(x)');
title('Numerical Solution Concentration');


function [g, f, s] = pdefuna(x, ~, c, dcdx, params)
    % Define the PDE
    A = pi * r(x,params).^2; % Cross-sectional area
    g = A;
    f = params.D * A .* dcdx;
    s = -params.k *A .* c;
end


function c0 = icfuna(~, params)
    % Set initial condition
    c0 = params.c0;
end

function [pL, qL, pR, qR] = bcfuna(~, ~, xR, ~, ~, params)
    % Set boundary conditions
    pL = 0; 
    qL = 1; 
    A = pi * r(xR,params).^2;
    pR = -1./(params.D*A); 
    qR = 1; 
end

function r = r(x, params)
    % Define the radius of the tube
    rb = params.rb;
    x0 = params.x0;
    x4 = params.x4;
    b0 = params.b0;
    b4 = params.b4;
    a0 = params.a0;
    a4 = params.a4;
    x1 = params.x1;
    x2 = params.x2;
    x3 = params.x3;
    x5 = params.x5;

    if x <= x1
        r(x <= x1) = rb;
    elseif x > x1 && x <= x0
        r(x > x1 & x <= x0) = a0 * (x(x > x1 & x <= x0) - x0) + b0; 
    elseif x > x0 && x <= x2
        r(x > x0 & x <= x2) = -a0 * (x(x > x0 & x <= x2) - x0) + b0; 
    elseif x > x2 && x <= x3 
        r(x > x2 & x <= x3) = rb;
    elseif  x > x3 && x <= x4  
        r(x > x3 & x <= x4) = a4 * (x(x > x3 & x <= x4) - x4) + b4;
    elseif x > x4 && x <= x5
        r(x > x4 & x <= x5) = -a4 * (x(x > x4 & x <= x5) - x4) + b4;
    elseif x > x5
        r(x > x5) =rb;
    end
end



