clear
clc
close all

% Constant declaration
m = 13;
N = [1,2,3,10,30,100];  % n's number
s = 3*ones(1,length(N));    
t = 1e4;   % Sample's size
std = sqrt(s./N);   % Standard deviation vector result from different n
nbins = 10;
figure

for i = 1:length(N)
    ZiSample = zeros(1,t); % Generate that zi vector to store generated sample of different n.
    for j = 1:t            % Generate zi t times
        zi = 0;
        for k = 1:N(i)
        zi = zi + unifrnd(10,16); 
        end
        ZiSample(j) = zi/N(i); % Store that zi in each position
    end
    subplot(2,3,i)
    histogram(ZiSample,'Normalization','pdf',"DisplayStyle" ,"stairs")
    hold on    
    % Plot the Gaussian with analytical parameters
    s = rng;
    rnorm = normrnd(m,std(i),[1,t]);
    histogram(rnorm,'Normalization','pdf',"DisplayStyle" ,"stairs")
    title(['N = ' num2str(N(i))])
    xlabel('x')
    ylabel('Zn distribution')
    rng(s);
    %Commented out because it blocks the histogram
    %lgd = legend('pdf(Zn)','pdf(Gaussian)');
    %fontsize(lgd,3,'points')
end