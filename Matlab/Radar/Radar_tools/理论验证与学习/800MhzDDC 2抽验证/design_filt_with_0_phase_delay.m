LP_filter = designfilt('lowpassfir',...
                       'PassbandFrequency', 130e6,...
                       'StopbandFrequency', 200e6,...
                       'PassbandRipple', 0.2,...
                       'StopbandAttenuation', 60,...
                       'SampleRate', 800e6);
save LP_filter LP_filter