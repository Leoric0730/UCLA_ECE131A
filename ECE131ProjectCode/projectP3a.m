clear
clc
close all 

l = 887;
Data = csvread('user_data.csv',1);
B = Data(:,1);
T = Data(:,2);
S = Data(:,3);
A = Data(:,4);

[x1,p1] = pmfPlotHelper(B);
figure
subplot(4,1,1)
stem(x1, p1, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of B');

[x2,p2] = pmfPlotHelper(T);
subplot(4,1,2)
stem(x2, p2, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of T')

[x3,p3] = pmfPlotHelper(S);
subplot(4,1,3)
stem(x3, p3, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of S')

[x4,p4] = pmfPlotHelper(A);
subplot(4,1,4)
stem(x4, p4, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of A')
function nRepeat = repetition(Vec, element)
    count = 0;
    for i = 1:length(Vec)
        if Vec(i) == element
            count = count +1;
        end         
    end 
    nRepeat = count;
end
 function [fNumberVec, Probability] = pmfPlotHelper(inputVec)
    numberVec = [];
    for i = 1:length(inputVec)
        if ismember(inputVec(i),numberVec) == 0
                numberVec = [numberVec, inputVec(i)];
        end 
    end
    fNumberVec = numberVec;
    for j = 1:length(numberVec)
        Probability(j) = repetition(inputVec, numberVec(j))/length(inputVec);
    end
end
 