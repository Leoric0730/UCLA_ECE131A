clear
clc
close all

% Load the data and initialize mean and variance
data = load('data.txt');
l = length(data);
miuMLE = sum(data)/l;
sigmaMLE = sqrt(sum((data-miuMLE).^2)/l);

% Plot the data with the Maximum likelihood Estimation of Guassian generated 
% with mean miuMLE and sigmaMLE
figure;
histogram(data,'Normalization','pdf')
hold on
pd = makedist('Normal','mu',miuMLE,'sigma',sigmaMLE);
x = 20:0.1:120;
y = normpdf(x,miuMLE,sigmaMLE);
plot(x,y,lineWidth = 1)
xlabel('Data')
ylabel('Probability')
title('Data distribution and Maximum Looklihood Estimation')