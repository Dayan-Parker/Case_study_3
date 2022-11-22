clear, clc, close all

d1 = 0.2; %distance
d2 = 0.8;
%focal length
f = 150*(1/1000);

%propagation matrix before the lens
Md = [1 d1 0 0;0 1 0 0;0 0 1 d1;0 0 0 1];
%propagation matrix after the lens
Md2 = [1 d2 0 0;0 1 0 0;0 0 1 d2;0 0 0 1];
%lens matrix
Mf = [1 0 0 0;-(1/f) 1 0 0;0 0 1 0; 0 0 -(1/f) 1];

%number of rays to simulate
N = 5;

% vector of the initial x & z positions of the objects
xPositions1 = zeros(1,N);
xPositions2 = ones(1,N)*0.015;
zPositions1 = zeros(1,N);
zPositions2 = ones(1,N)*0.015;

%evenly divide angle between -pi/20 and pi/20 N times
Angles = linspace(-pi/20,pi/20,N);

%concatenate the x positions, z positions and angles into "rays1" and
% rays2" in the form shown in the assignment.
rays_1 = [xPositions1; Angles; zPositions1; Angles];
rays_2 = [xPositions2; Angles; zPositions2; Angles];

%Multiply the rays by the propagation matrix before the lens
rays_Prop1 = Md*rays_1;
rays_Prop2 = Md*rays_2;

%plot the rays before they reach the lens
x1 = [zeros(1,N);ones(1,N)*d1];
z1 = [xPositions1;rays_Prop1(1,:)];
x2 = [zeros(1,N);ones(1,N)*d1];
z2 = [xPositions2;rays_Prop2(1,:)];

figure
hold on
plot(x1,z1,"red");
plot(x2,z2,"blue");

%multiply the propagated ray vectors by the lens matrix
rays_lens1 = Mf*rays_Prop1;
rays_lens2 = Mf*rays_Prop2;

%multiply the rays after they have hit the lens by the second propagation
%matrix
rays_Prop1M2 = Md2*rays_lens1;
rays_Prop2M2 = Md2*rays_lens2;

%plot the ray propagation after they hit the lens
x1M2 = [ones(1,N)*d1;ones(1,N)*(d1+d2+0.2)];
z1M2 = [rays_lens1(1,:);rays_Prop1M2(1,:)];
x2M2 = [ones(1,N)*d1;ones(1,N)*(d1+d2+0.2)];
z2m2 = [rays_lens2(1,:);rays_Prop2M2(1,:)];

plot(x1M2,z1M2,"red");
plot(x2M2,z2m2,"blue");

xlabel("z(m)")
ylabel("x(m)")
axis([0, 1.3 -0.06,0.08]);
title(N+" rays with a lens at"+d1+" meters with focal" + ...
    "with "+f+" focal length");

hold off
