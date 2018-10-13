function [hitnum,oprnum,hitrate,freqpatterns] = profilegen(oprprof,storagesize)
oprnum=sum(oprprof(:,1));
hitnum=sum(oprprof(1:storagesize,1));
hitrate=hitnum/oprnum;
freqpatterns=(oprprof(1:storagesize,2));

