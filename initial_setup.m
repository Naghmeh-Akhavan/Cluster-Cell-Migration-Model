function d = initial_setup()
% Set up the parameters and import data for the simulation
% Refer to readme.md for more information
% 
% By Naghmeh Akhavan 2024

%% Optional variables Change according to appliction
d.r=10;                         % radius of the cluster
d.L=200;                        % length of the domain
d.perc=0;                       % percentage of the intercetion depth
d.x0=57.482;                    % center of the first intercetion
d.x4=111.96;                    % center of the second intercetion
d.xhat0=7.5;                    % half length of the first intercetion
d.xhat4= 10;                    % half length of the second intercetion
d.b0=0.25279+d.perc*0.25279;    % 1st intercetion depth
d.b4=0.668666+d.perc*0.668666;  % 2nd intercetion depth
d.rb=.18+ d.perc*.18;           % radius of the baseline tube
d.x=0:0.01:d.L;                 % nodes in the domain
d.new_l = 829.416;              % half max
d.ode_s = .504;                 % maximum saturation
d.a = 17;                       % rescaling parameter
d.D = 1;                        % diffusion coefficient of the chemoattractant
d.k = 0.00042;                  % degradation rate of the chemoattractant
d.T = 0 : .5: 25000;            % time mesh 


%% Data Import
% Data points for the position
d.p = [32.3550000000000
39.3830000000000
47.8840000000000
54.2810000000000
59.8890000000000
67.3480000000000
72.5710000000000
78.1010000000000
85.4500000000000
91.1240000000000
94.7620000000000
97.2350000000000
101.354000000000
103.334000000000
104.857000000000
107.341000000000
107.195000000000
108.936000000000
110.984000000000
112.058000000000
112.947000000000
114.820000000000
118.621000000000
123.556000000000
128
130.938000000000
133.837000000000];

% Data points for the speed
d.spd=[1.40560000000000
1.70020000000000
1.27940000000000
1.12160000000000
1.49180000000000
1.04460000000000
1.10600000000000
1.46980000000000
1.13480000000000
0.727600000000001
0.494600000000000
0.823800000000000
0.396000000000001
0.304599999999999
0.496799999999999
-0.0292000000000002
0.348200000000003
0.409599999999998
0.214800000000002
0.177799999999999
0.374599999999998
0.760200000000000
0.987000000000000
0.888800000000001
0.587599999999998
0.579800000000000];

d.T_alt=5*[1.5 : length(d.p)+0.5]*60;           % Time mesh for the data points
d.T_fine=5*[1.5 : 0.05 : length(d.p)+3.5]*60;   % Finer mesh of time

%% Dependent variables
d.a0=(d.b0-d.rb)/d.xhat0;
d.a4=(d.b4-d.rb)/d.xhat4;
d.x1=d.x0-d.xhat0;
d.x2=d.x0+d.xhat0;
d.x3=d.x4-d.xhat4;
d.x5=d.x4+d.xhat4;

end %global function