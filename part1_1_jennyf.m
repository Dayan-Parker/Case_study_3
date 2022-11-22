clear
%direction:5 rays with angles 𝜃𝑥 between −𝜋/20 rad and 𝜋/20 rad
theta=linspace(-pi/20,pi/20,5);
%find the distance of rays
z=linspace(0,0.2,1000);

%set up 3D ray-transfer matrix M that represents propagation in free space
%and compute the new position and angle of ray after traveling a distance z
for i=1:length(theta)
 for j=1:length(z)
%following the 3D ray-transfer matrix M defination
    M=[1,z(j),0,0;
       0,1,0,0;
       0,0,1,z(j);
       0,0,0,1];
%setting the initial condition of 2 rays: 
%(blue) 𝑥 = 0 and (red) 𝑥 =10 mm.
    x0_input=[0,theta(i),0,0]';
    x1_input=[0.01,theta(i),0,0]';
%using the linear combination equation:y=Ax and plug in values
    x0_output(:,j)=M*x0_input;
    x1_output(:,j)=M*x1_input;
 end

x0(i,:)=x0_output(1,:);
x1(i,:)=x1_output(1,:);
end

%(blue) 𝑥 = 0 and (red) 𝑥 = 10 mm.
plot(z,x0,'b')
hold on 
plot(z,x1,'r')
xlabel('z(m)')
ylabel('x(m)')
title("A fan of rays propagating through free space")
