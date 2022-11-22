clear, clc, close all
load lightField.mat

%loop through 3 different sensor sizes
figure
for i=1:3
   %create variables for the distance, sensor width and number of pixels
   d=0.2;
   width = 5*i*(1/100);
   Npixels = 400;
   %create a propagation matrix
   Md = [1 d 0 0;0 1 0 0;0 0 1 d;0 0 0 1]; %distance matric

   %multiply rays from lightField.mat by the propagation matrix
   raysProp = Md*rays;

   %show the image recovered for
   hold on
   subplot(3,1,i);
   [img,x,y] = rays2img(raysProp(1,:),raysProp(3,:),width,Npixels);
   imshow(img);
   title(width+" sensor width & "+Npixels+" pixels")
end
hold off;

%loop through 3 different numbers of pixels
figure
for i=1:3
   %create variables for the distance, sensor width and number of pixels
   d=0.2;
   width = 5*(1/100);
   Npixels = 400*i;

   %create a propagation matrix
   Md = [1 d 0 0;0 1 0 0;0 0 1 d;0 0 0 1]; %distance matric

   %multiply rays from lightField.mat by the propagation matrix
   raysProp = Md*rays;
   
   %show the image recovered for
   hold on
   subplot(3,1,i);
   [img,x,y] = rays2img(raysProp(1,:),raysProp(3,:),width,Npixels);
   imshow(img);
   title(width+" sensor width & "+Npixels+" pixels")
end
hold off;
