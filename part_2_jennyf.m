clear, clc, close all
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
width=0.005;%sensor width 5mm
Npixels=200;%the number of pixels 200

%Use the function rays2img() to render an image of the rays
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels);
figure()
image(x,y,img);
axis image xy;
title('Image created from the light field dataset')

%We can not see the object clearly

clear
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
%By increasing/decreasing the sensor width, we try to find sharp image b
width=[0.005,0.01,0.015,0.02,0.025,0.03];
Npixels=200;%the number of pixels 200
figure
for i=1:length(width)
[img,x,y]=rays2img(rays_x,rays_y,width(i),Npixels);
subplot(2,3,i);
image(x,y,img);
title(width(1,i)+" width & "+Npixels+" pixels")
hold on
axis image xy;
xlabel("z(m)")
ylabel("x(m)")
end
hold off
%the number of pixels is set to 200, and the width gradually increases 
% from 5mm to 30mm. As width increases, we can see more complete light spots
%but the image cannot be seen clearly. 
%Because changing the width size is just zooming in or out.

clear
load lightField
rays_x=rays(1,:);
rays_y=rays(3,:);
width=0.005;%width 5mm
%increasing/decreasing the number of sensor pixels
Npixels=[200,400,600,800,1000,1200];
figure
title("images of different sensor pixels");
for i=1:length(Npixels)
[img,x,y]=rays2img(rays_x,rays_y,width,Npixels(i));
subplot(2,3,i);
image(x,y,img);
axis image xy;
xlabel("z(m)")
ylabel("x(m)")
title(width+" width & "+Npixels(1,i)+" pixels")
end

%Set the width to 5mm, and increase the number of pixels from 200 to 1200.
%As the number of pixels increases, the image gradually blurs.
%Because the number of light rays passing through the cross-section 
%of the sensor is constant, when the number of pixels gradually increases,
%more pixels do not capture light, and more black spots appear.
