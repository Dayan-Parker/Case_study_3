clc, clear,
load lightField.mat

d1 = 0.2; %distance
d2 = 0.6;
f1 = 1/((1/d1A)+(1/d2A));
Md = [1 d1 0 0;0 1 0 0;0 0 1 d1;0 0 0 1]; %distance matric
Md2 = [1 d2 0 0;0 1 0 0;0 0 1 d2;0 0 0 1]; %distance matric
Mf1 = [1 0 0 0;-(1/f1) 1 0 0;0 0 1 0; 0 0 -(1/f1) 1]; %

width = 5*(1/100);
Npixels = 1000;


raysProp = Md*rays;
raysLens1 = Mf1*raysProp;
raysPropf = Md2*raysLens1;

[img,x,y] = rays2img(raysPropf(1,:),raysPropf(3,:),width,Npixels);
figure
imshow(img);


