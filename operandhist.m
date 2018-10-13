function [HistSort] = operandhist(operands)

operands_unique=unique(operands);
[Counts, Value]=hist(operands, operands_unique);
HistNonSort=[Counts;
    Value'];
HistNonSort=HistNonSort';
HistSort=sortrows(HistNonSort,-1);