clear
clc
close all 

l = 887;
Data = csvread('user_data.csv',1);
% Divide the whole User data list into two lists where the first one only
% has B = 0, and the second only has B = 1.
DataB0 = [];
DataB1 = [];
for i = 1:l
    if Data(i,1) == 0
        DataB0 = [DataB0; Data(i,:)];
    
    else 
        DataB1 = [DataB1; Data(i,:)];
    end

end

% Find out each T,S, and A vector given the conditions of B = 0 or 1. Use
% the function declared before to help us to solve each conditional pmf.
T0 = DataB0(:,2);
T1 = DataB1(:,2);
S0 = DataB0(:,3);
S1 = DataB1(:,3);
A0 = DataB0(:,4);
A1 = DataB0(:,4);

[x10,p10] = pmfPlotHelper(T0);
figure
subplot(3,2,1)
stem(x10, p10, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of T given B = 0');

[x11,p11] = pmfPlotHelper(T1);
subplot(3,2,2)
stem(x11, p11, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of T given B = 1');

[x20,p20] = pmfPlotHelper(S0);
subplot(3,2,3)
stem(x20, p20, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of S given B = 0');

[x21,p21] = pmfPlotHelper(S1);
subplot(3,2,4)
stem(x21, p21, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of S given B = 1');

[x30,p30] = pmfPlotHelper(A0);
subplot(3,2,5)
stem(x30, p30, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of S given A = 0');

[x31,p31] = pmfPlotHelper(A1);
subplot(3,2,6)
stem(x31, p31, "LineStyle", '-.', 'MarkerFaceColor', 'red', 'MarkerEdgeColor','green','LineWidth',2);
ylim([0,1])
title('pmf of S given A = 1');

% Further compute the probabilty that A <= 67 given B=0 and B=1:

count1 = 0;
for i = 1:length(DataB0)
    if DataB0(i,4) <= 67
        count1 = count1 +1;
    end
end 
prob1 = count1/length(DataB0);
fprintf('The probability that A <= 67 given B = 0 is %5.4f. \n',prob1)

count2 = 0;
for j = 1:length(DataB1)
    if DataB1(j,4) <= 67
        count2 = count2 +1;
    end
end 
prob2 = count2/length(DataB1);
fprintf('The probability that A <= 67 given B = 1 is %5.4f. \n',prob2)

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