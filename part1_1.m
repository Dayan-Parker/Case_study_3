clear, clc, close all
%% ray tracing basics:
d = 0.2; %distance for the light to propagate
Md = [1 d 0 0;0 1 0 0;0 0 1 d;0 0 0 1]; %distance matric
N = 6; %the numbers of rays you wish to simulate from each object

% vector of the initial x & z positions of the objects
xPositions1 = zeros(1,N);
xPositions2 = ones(1,N)*0.015;
zPositions1 = zeros(1,N);
zPositions2 = ones(1,N)*0.015;

%evenly divide angle between -pi/20 and pi/20 N times
Angles = linspace(-pi/20,pi/20,N);

%concatenate the x positions, z positions and angles into "rays1" and
% rays2" in the form shown in the assignment.
rays1 = [xPositions1; Angles; zPositions1; Angles];

%Multiply rays1 and 2 by the propagation matrix.
rays_Prop1 = Md*rays1;
rays2 = [xPositions2; Angles; zPositions2; Angles];
rays_Prop2 = Md*rays2;

%create vectors containing the x and z values for all rays for graphing
%purposes.
x1 = [zeros(1,N);ones(1,N)*d];
z1 = [xPositions1;rays_Prop1(1,:)];
x2 = [zeros(1,N);ones(1,N)*d];
z2 = [xPositions2;rays_Prop2(1,:)];

%plot the two objects with ray propagating from them
figure
hold on
plot (x1,z1,"red");
plot (x2,z2, "blue");
xlabel("z(m)")
ylabel("x(m)")
title("A fan of rays propagating through free space");
axis([0, 0.2 -0.06,0.08]);
hold off
