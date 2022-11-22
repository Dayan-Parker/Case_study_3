clear, clc,close all
load lightField.mat

%create variables for the sensor width and number of pixels
width = 2*(1/100);
Npixels = 1000;

%this code was originally looked to find an acceptable d value
%for i = 0:0.1:2
d = 1;

%create the inverse matrix
Md2 = [1 -d 0 0;0 1 0 0;0 0 1 -d;0 0 0 1];

%multiply rays by the inverse propagation matrix
raysReverse = Md2*rays;

[img,x,y] = rays2img(raysReverse(1,:),raysReverse(3,:),width, Npixels);
figure
imshow(img);
title("image from rays reversed using the inverse propagation matrix")
%title("image"+i*10);
%end
