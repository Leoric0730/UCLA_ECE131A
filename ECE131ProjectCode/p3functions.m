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