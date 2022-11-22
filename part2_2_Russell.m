clc, clear,close all
load lightField.mat

%create variables for the sensor width and number of pixels
width = 4*(1/100);
Npixels = 1000;

%this code was originally looped to find the value for d2
%for i = 3.4:0.01:4
d = 1; %distance
d2 = 3.56;
f1 = (1/d)+(1/d2);

%distance matrix for propagation before the lens
Md = [1 d 0 0;0 1 0 0;0 0 1 d;0 0 0 1];

%distance matrix for propagation after the lens
Md2 = [1 d2 0 0;0 1 0 0;0 0 1 d2;0 0 0 1];

%lens matrix
Mf1 = [1 0 0 0;-(1/f1) 1 0 0;0 0 1 0; 0 0 -(1/f1) 1];

%multiply rays by the
raysProp = Md2*Mf1*Md*rays;

[img,x,y] = rays2img(raysProp(1,:),raysProp(3,:),width,Npixels);
figure();
imshow(img);
title("image with "+d+" initial propagation "+f1+" focal length & "+d2+ ...
    " final propagation")
%title("image"+i*10);
%end


