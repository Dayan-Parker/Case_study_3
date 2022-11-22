clear
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
width=0.005;%5mm
Npixels=200;%
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
image(x,y,img);
axis image xy;
title('width 5mm')

clear
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
width=[0.005,0.01,0.015,0.02,0.025,0.03];
Npixels=200;%
for i=1:length(width)
[img,x,y]=rays2img(rays_x,rays_y,width(i),Npixels);
subplot(2,3,i);
image(x,y,img);
hold on
axis image xy;
end

clear all
close all
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
width=0.005;%5mm
Npixels=[200,400,600,800,1000,1200];
for i=1:length(Npixels)
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels(i));
subplot(2,3,i);
image(x,y,img);
hold on
axis image xy;
end

