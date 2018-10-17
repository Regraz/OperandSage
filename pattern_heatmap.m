%Draw 1-D heatmap of operands. 
%function [selected_operands] = pattern_heatmap(pattern, count)
function [selected_operands] = pattern_heatmap(filepath, count)
format long;
pattern_str=textread(filepath,'%s');
pattern=ones(size(pattern_str,1),1);
for j=1:size(pattern_str,1)
    pattern(j)=binstr2float(pattern_str{j});
end

%%%
step=floor(size(pattern,1)/(count+1));
selected_operands=ones(count,1);

for i=1:count
    selected_operands(i)=pattern(step*i+floor(step*rand));
end

% hold on;
% subplot(2,2,1);
% hist(selected_operands,100);
% xlabel("Range of Operands (Float) / Range Length: 0.02");
% ylabel("Number of Operands in Each Range")
% title("Distribution of 2000 Randomly Selected Multiply Operands, Global");

% subplot(2,2,2);
% hist(selected_operands,100);
% xlabel("Range of Operands (Float) / Range Length: 0.02");
% ylabel("Number of Operands in Each Range")
% title("Distribution of 2000 Randomly Selected Multiply Operands, Layer 1");

% subplot(2,2,3);
% hist(selected_operands,100);
% xlabel("Range of Operands (Float) / Range Length: 0.02");
% ylabel("Number of Operands in Each Range")
% title("Distribution of 2000 Randomly Selected Multiply Operands, Layer 2");

subplot(2,2,4);
hist(selected_operands,100);
xlabel("Range of Operands (Float) / Range Length: 0.02");
ylabel("Number of Operands in Each Range")
title("Distribution of 2000 Randomly Selected Multiply Operands, Layer 3");

