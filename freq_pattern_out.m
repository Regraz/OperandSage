function [] = freq_pattern_out(freqpattern, filepath_full, freqpattern_bit,operation)
charzero_pre='00000000000000000000000000000000000000000000000000000000000000000';
charzero_suf='10000000000000000000000000000000000000000000000000000000000000000';
%Output Format should be like:
%freq_pattern[std::make_tuple("0000000000000", "1011111110000")] = -1.03125;
binstream_nonalign=string(freqpattern);

str_std=charzero_pre(1:freqpattern_bit*2);
binstream = string(str_std(ones(size(freqpattern,1),1),:));

fpath=fopen(filepath_full,'a+');

for q=1:size(freqpattern)
    binstream_nonalign(q)=dec2bin(freqpattern(q));
end

for p=1:size(freqpattern)
    binstream{p}=[charzero_pre(1:(freqpattern_bit*2-size(binstream_nonalign{p},2))),binstream_nonalign{p}];
end


for w=1:size(binstream)
    
    opr1binstr=[binstream{w}(1:(size(binstream{w},2)/2)),charzero_suf(1:(32-(size(binstream{w},2)/2)))];
    opr2binstr=[binstream{w}((size(binstream{w},2)/2+1):size(binstream{w},2)),charzero_suf(1:(32-(size(binstream{w},2)/2)))];
    
    opr1float=binstr2float(opr1binstr);
    opr2float=binstr2float(opr2binstr);
    
    if operation==1
    resfloat=string(opr1float*opr2float);
    end
    
    if operation==2
        resfloat=string(opr1float+opr2float);
    end
    ostr=['freq_pattern[std::make_tuple("',binstream{w}(1:(size(binstream{w},2)/2)),'", "',binstream{w}((size(binstream{w},2)/2+1):size(binstream{w},2)),'")] = ',resfloat{1},';'];
    fprintf(fpath,'%s',ostr);
    fprintf(fpath,'\n');
    
end
fprintf(fpath,'%s','This is the end of this bit length.');
fprintf(fpath,'\n');
fclose('all'); 
