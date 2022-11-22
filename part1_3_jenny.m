clear
close all
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);%produce 50000 rays along the straight line
thetax=pi/3;
thetay=pi/3;%
d=0.02;%
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end
rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%
Npixels=500;%
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;

clear
close all
x=linspace(-0.05,0.001,50000);
y=linspace(-0.05,0.001,50000);%
d=0.02;%
for i=1:length(x)
    M=[1,d,0,0;0,1,0,0;0,0,1,d;0,0,0,1];
    thetax=-pi/20+pi/10*rand;
    thetay=-pi/20+pi/10*rand;
    x_input=[x(i);thetax;y(i);thetay];
    x_output(:,i)=M*x_input;
end
rays_x=x_output(1,:);
rays_y=x_output(3,:);
width=0.05;%
Npixels=500;%
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;

