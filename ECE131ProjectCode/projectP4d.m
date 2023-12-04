clear
clc
close all

% Constant declaration

pmf = [1/17, 2/17, 2/17, 1/17, 2/17, 1/17, 2/17, 1/17, 1/17, 1/17, 2/17, 1/17];
population = 1:12;

m = 6.24;
N = [1,2,3,10,30,100];  % n's number
s = 11.65*ones(1,length(N));    
% Standard deviation vector result from different n
std = sqrt(s./N); 
t = 1e4;   % Sample's size
figure

for i = 1:length(N)
    ZiSample = zeros(1,t); % Generate that zi vector to store generated sample of different n.
    for j = 1:t            % Generate zi t times
        random_num_vec = randsample(population,N(i),true,pmf);
        ZiSample(j) = sum(random_num_vec)/N(i); % Store that zi in each position
    end

    subplot(2,3,i)
    histogram(ZiSample,'Normalization','pdf','BinWidth',1/(1+N(i)) ,"DisplayStyle" ,"stairs")
    hold on    
    % Plot the Gaussian with analytical parameters
    s = rng;
    rnorm = normrnd(m,std(i),[1,t]);
    histogram(rnorm,'Normalization','pdf', 'BinWidth',1/(1+N(i)) ,"DisplayStyle" ,"stairs")
    title(['N = ' num2str(N(i))])
    xlabel('x')
    ylabel('Zn distribution')
    rng(s);
    %Commented out because it blocks the histogram
    %lgd = legend('pdf(Zn)','pdf(Gaussian)');
    %fontsize(lgd,3,'points')
end