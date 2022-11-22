clear
close all
figure
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);%produce 50000 rays along the straight line
thetax=pi/3;
thetay=pi/3;%propagating directions are the same
d=0.02;%propagation distance
%matrix M and initial condition 
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end

rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%sensor width
Npixels=500;%the number of pixels
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;
xlabel("z(m)")
ylabel("x(m)")
title("propagation in the same direction")

clear
figure
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);
d=0.02;%propagation distance
%matrix M and initial condition 
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
%assume propagating directions are distributed randomly from -pi/20 to
%pi/20
    thetax=-pi/20+pi/10*rand;
    thetay=-pi/20+pi/10*rand;
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end

rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%sensor width
Npixels=500;%the number of pixels
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
xlabel("z(m)")
ylabel("x(m)")
axis image xy;
title("propagation in different directions")
%When the propagation directions are consistent, the beams can still
%maintain a relatively complete shape after propagation,
%but when the propagation directions are inconsistent, each beam becomes
%chaotic and cannot effectively restore the original image.



%In order to further illustrate the influence of the propagation distance
%we assume that propagation direction is changing randomly
%and change propagation distances to 0.0001m and 0.1m are respectively 
%as shown.

clear
figure
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);
d=0.0001;%propagation distance
%matrix M and initial condition 
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
%assume propagating directions are distributed randomly from -pi/20 to
%pi/20
    thetax=-pi/20+pi/10*rand;
    thetay=-pi/20+pi/10*rand;
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end

rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%sensor width
Npixels=500;%the number of pixels
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;
title("propagation in different directions when distance is 0.001m")

clear
figure
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);
d=0.1;%propagation distance
%matrix M and initial condition 
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
%assume propagating directions are distributed randomly from -pi/20 to
%pi/20
    thetax=-pi/20+pi/10*rand;
    thetay=-pi/20+pi/10*rand;
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end

rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%sensor width
Npixels=500;%the number of pixels
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;
title("propagation in different directions when distance is 0.1m")

%When the propagation distance is short, the shape depicted
%by the beam can still be distinguished, but whendistance is long,
% due to randomn propagation directions, the image can't be recognized.

