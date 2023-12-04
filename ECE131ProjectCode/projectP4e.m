clear
clc
close all

% Constant declaration
dx = 0.1;
x = 10:dx:16;
y = 1/6*ones(1,length(x));

m = 13;
N = [1,2,3,10,30,100];  % n's number
s = 3*ones(1,length(N));    
t = 1e4;   % Sample's size
std = sqrt(s./N);   % Standard deviation vector result from different n

figure

for i = 1:length(N)
    yi = y;
    for j = 1:length(N(i))  
        q = conv(yi, y);
        yi = q;
        %plot((0:(numel(q)-1))*dx,q*dx)
    
    end
    q_x = (1:length(q)).* dx + x(1);
    
    subplot(2,3,i)
    plot(q_x, dx*q,'r');
    hold on    
    % Plot the Gaussian with analytical parameters
    %s = rng;
    rnorm = normrnd(m,std(i),[1,t]);
    histogram(rnorm,'Normalization','pdf','FaceAlpha',0.6)
    title(['N = ' num2str(N(i))])
    xlabel('x')
    ylabel('Zn distribution')
    %rng(s);
    %Commented out because it blocks the histogram
    %lgd = legend('pdf(Zn)','pdf(Gaussian)');
    %fontsize(lgd,3,'points')
end