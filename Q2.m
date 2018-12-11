close all;
lake = imread('planets.jpg');
figure;
swamp = rgb2gray(lake);
imshow(swamp)
figure

sigma = 1;
B = imgaussfilt(swamp,'FilterSize',7);
imshow(B)
figure
BW2 = edge(B,'canny');
imshow(BW2)
radius = [10, 250];
use_gradient = 0;
[centers, radii, metric] = myCircleDetection ( BW2, radius , use_gradient) 

radius = [15, 200];
use_gradient = 0;
virtuos_Enkidu = myCircleDetection ( BW2, radius , use_gradient) 

radius = [100, 200];
use_gradient = 1;
virtuos_GilGam = myCircleDetection ( BW2, radius , use_gradient) 

radius = [100, 300];
use_gradient = 0;
virtuos_Ish = myCircleDetection ( BW2, radius , use_gradient) 

function [centers, radii, metric] = myCircleDetection ( image, radius , use_gradient)        
 
if( use_gradient == 0)
    [centers,radii,metric] = imfindcircles(image,radius);
end

if( use_gradient == 1)
    [centers,radii,metric] = imfindcircles(image,radius, 'EdgeThreshold', use_gradient);
end

centersStrong5 = centers(1:5,:); 
radiiStrong5 = radii(1:5);
metricStrong5 = metric(1:5);

viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');

end
