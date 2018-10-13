function [dec] = bin2dec64bitver(bin)
v = uint64(length(bin)-1:-1:0);
base = uint64(2).^v;
% dec = uint64(sum(uint64(base.*(uint64(bin-'0'))))); https://stackoverflow.com/questions/32334748/convert-64-bit-numbers-from-binary-to-decimal-using-uint64
dec = sum(uint64(base.*(uint64(bin-'0'))), 'native');
end