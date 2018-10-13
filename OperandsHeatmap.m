clear all;
Storage = [128,64,32,16,8];
BitAccuracy = {'32','12','11','10','9'};

conv2d_op_mult_hitrate_layerwise=magic(5);
conv2d_op_add_hitrate_layerwise=magic(5);

for i=1:5

%Read operands BIN database

conv2d_op_add1_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_add1_bit.txt'],'%s'); 
conv2d_op_add2_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_add2_bit.txt'],'%s'); 
conv2d_op_add3_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_add3_bit.txt'],'%s');
conv2d_op_mult1_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_mult1_bit.txt'],'%s');
conv2d_op_mult2_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_mult2_bit.txt'],'%s');
conv2d_op_mult3_bin=textread(['D:\tiny_dnn\tiny_dnn\operands\Bit Accuracy - ',BitAccuracy{1,i},'\bitwise\conv2d_op_mult3_bit.txt'],'%s');

for j=1:5

%Add Operands
conv2d_op_add1=zeros(size(conv2d_op_add1_bin,1),1);
conv2d_op_add2=zeros(size(conv2d_op_add2_bin,1),1);
conv2d_op_add3=zeros(size(conv2d_op_add3_bin,1),1);

if i==1
    for cnt=1:size(conv2d_op_add1_bin,1)
        conv2d_op_add1(cnt,1)=bin2dec64bitver(conv2d_op_add1_bin{cnt,1});
    end
    for cnt=1:size(conv2d_op_add2_bin,1)
        conv2d_op_add2(cnt,1)=bin2dec64bitver(conv2d_op_add2_bin{cnt,1});
    end
    for cnt=1:size(conv2d_op_add3_bin,1)
        conv2d_op_add3(cnt,1)=bin2dec64bitver(conv2d_op_add3_bin{cnt,1});
    end
end

if i~=1
    for cnt=1:size(conv2d_op_add1_bin,1)
        conv2d_op_add1(cnt,1)=bin2dec(conv2d_op_add1_bin{cnt,1});
    end
    for cnt=1:size(conv2d_op_add2_bin,1)
        conv2d_op_add2(cnt,1)=bin2dec(conv2d_op_add2_bin{cnt,1});
    end
    for cnt=1:size(conv2d_op_add3_bin,1)
        conv2d_op_add3(cnt,1)=bin2dec(conv2d_op_add3_bin{cnt,1});
    end
end

conv2d_op_add=[conv2d_op_add1; conv2d_op_add2; conv2d_op_add3];
[conv2d_op_add1_hitnum,conv2d_op_add1_oprnum,conv2d_op_add1_hitrate,conv2d_op_add1_freqpatterns]=profilegen(operandhist(conv2d_op_add1),Storage(1,j));
[conv2d_op_add2_hitnum,conv2d_op_add2_oprnum,conv2d_op_add2_hitrate,conv2d_op_add2_freqpatterns]=profilegen(operandhist(conv2d_op_add2),Storage(1,j));
[conv2d_op_add3_hitnum,conv2d_op_add3_oprnum,conv2d_op_add3_hitrate,conv2d_op_add3_freqpatterns]=profilegen(operandhist(conv2d_op_add3),Storage(1,j));
[conv2d_op_add_hitnum,conv2d_op_add_oprnum,conv2d_op_add_hitrate,conv2d_op_add_freqpatterns]=profilegen(operandhist(conv2d_op_add),Storage(1,j));

%Multiply Operands


conv2d_op_mult1=zeros(size(conv2d_op_mult1_bin,1),1);
conv2d_op_mult2=zeros(size(conv2d_op_mult2_bin,1),1);
conv2d_op_mult3=zeros(size(conv2d_op_mult3_bin,1),1);

if i==1
for cnt=1:size(conv2d_op_mult1_bin,1)
    conv2d_op_mult1(cnt,1)=bin2dec64bitver(conv2d_op_mult1_bin{cnt,1});
end
for cnt=1:size(conv2d_op_mult2_bin,1)
    conv2d_op_mult2(cnt,1)=bin2dec64bitver(conv2d_op_mult2_bin{cnt,1});
end
for cnt=1:size(conv2d_op_mult3_bin,1)
    conv2d_op_mult3(cnt,1)=bin2dec64bitver(conv2d_op_mult3_bin{cnt,1});
end
end

if i~=1
    for cnt=1:size(conv2d_op_mult1_bin,1)
    conv2d_op_mult1(cnt,1)=bin2dec(conv2d_op_mult1_bin{cnt,1});
end
for cnt=1:size(conv2d_op_mult2_bin,1)
    conv2d_op_mult2(cnt,1)=bin2dec(conv2d_op_mult2_bin{cnt,1});
end
for cnt=1:size(conv2d_op_mult3_bin,1)
    conv2d_op_mult3(cnt,1)=bin2dec(conv2d_op_mult3_bin{cnt,1});
end
end

conv2d_op_mult=[conv2d_op_mult1; conv2d_op_mult2; conv2d_op_mult3];
[conv2d_op_mult1_hitnum,conv2d_op_mult1_oprnum,conv2d_op_mult1_hitrate,conv2d_op_mult1_freqpatterns]=profilegen(operandhist(conv2d_op_mult1),Storage(1,j));
[conv2d_op_mult2_hitnum,conv2d_op_mult2_oprnum,conv2d_op_mult2_hitrate,conv2d_op_mult2_freqpatterns]=profilegen(operandhist(conv2d_op_mult2),Storage(1,j));
[conv2d_op_mult3_hitnum,conv2d_op_mult3_oprnum,conv2d_op_mult3_hitrate,conv2d_op_mult3_freqpatterns]=profilegen(operandhist(conv2d_op_mult3),Storage(1,j));
[conv2d_op_mult_hitnum,conv2d_op_mult_oprnum,conv2d_op_mult_hitrate,conv2d_op_mult_freqpatterns]=profilegen(operandhist(conv2d_op_mult),Storage(1,j));

conv2d_op_mult_hitrate_layerwise(j,i)=(conv2d_op_mult1_hitnum+conv2d_op_mult2_hitnum+conv2d_op_mult3_hitnum)/conv2d_op_mult_oprnum;
conv2d_op_add_hitrate_layerwise(j,i)=(conv2d_op_add1_hitnum+conv2d_op_add2_hitnum+conv2d_op_add3_hitnum)/conv2d_op_add_oprnum;

if (j==1 && i~=1)
    freq_pattern_out(conv2d_op_mult1_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_mult1_freqpatterns.txt',str2num(BitAccuracy{1,i}),1);
    freq_pattern_out(conv2d_op_mult2_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_mult2_freqpatterns.txt',str2num(BitAccuracy{1,i}),1);
    freq_pattern_out(conv2d_op_mult3_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_mult3_freqpatterns.txt',str2num(BitAccuracy{1,i}),1);
    freq_pattern_out(conv2d_op_add1_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_add1_freqpatterns.txt',str2num(BitAccuracy{1,i}),2);
    freq_pattern_out(conv2d_op_add2_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_add2_freqpatterns.txt',str2num(BitAccuracy{1,i}),2);
    freq_pattern_out(conv2d_op_add3_freqpatterns,'D:\tiny_dnn\tiny_dnn\operands\Frequent Patterns\conv2d_op_add3_freqpatterns.txt',str2num(BitAccuracy{1,i}),2);
end
end
end
