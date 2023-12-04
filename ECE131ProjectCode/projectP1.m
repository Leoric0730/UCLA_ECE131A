clear
clc
close all

n = [50, 100, 1000, 2000, 3000, 10000, 100000];
pmf = [1/17, 2/17, 2/17, 1/17, 2/17, 1/17, 2/17, 1/17, 1/17, 1/17, 2/17, 1/17];
population = 1:12;
podd = zeros(1,7);
podd_uneven = zeros(1,7);
for i = 1:length(n)
    sample_size = n(i);
    podd(i) = dicetoss(sample_size);
    random_num_vec = randsample(population,sample_size,true,pmf);
    podd_uneven(i) = findOddProb(random_num_vec);
    fprintf('The probability that X has an odd value (even dice) is %5.4f with number of tosses %d \n', podd(i),sample_size)
    fprintf('The probability that X has an odd value (uneven dice) is %5.4f with number of tosses %d \n \n', podd_uneven(i),sample_size)
end
% display the podd for different nnumber of tossess and observe the trend.


% Another functon declared
function podd = findOddProb(vec)
    count = 0;
    for i = 1:length(vec)
        if mod(vec(i),2) == 1 
            count = count+1;
        
        end
    end
    podd = count/length(vec);
end 

function pOdd = dicetoss(n)
count = 0;
for i = 1:n
    m = randi([1,12]);
    if mod(m,2) == 1
        count = count + 1;
    end

end
pOdd = count/n;
end

