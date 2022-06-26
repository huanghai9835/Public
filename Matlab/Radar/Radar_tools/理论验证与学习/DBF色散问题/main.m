%--------------------------------------------------------------------------
%   宽带DBF的研究，不采用fft的方法进行dbf波束合成
%   问题描述:
%   窄带信号的DBF可以直接进行，但是宽带信号随着波长的变化，群时延不一样，会造成
%   波束指向不准，影响DBF的效果，如果采用fft的办法需要双路结构然后做
%   fft ifft 非常浪费资源，因此需要一种时域滤波器的方法进行宽带雷达的DBF
%--------------------------------------------------------------------------
clear;clc;

%--------------------------------------------------------------------------
%   参数配置
%--------------------------------------------------------------------------
c = 3e8;                                                                    %光速

fc_d = 3.1e9;                                                               %阵列设计的频段3GHz
fc = 3.0e9;                                                                 %实际发射电磁波波长

lambda_d = c/fc_d;                                                          %阵列对应波长
lambda = c/fc;                                                              %发射电磁波长

d = lambda_d/2;                                                             %阵列间距
M = 64;                                                                     %64阵元 

w_angle = 60;
d_array = (0:M-1).*d;

w = exp(1j*2*pi/lambda_d.*d_array.*sind(w_angle));                           %按照理论值构建导向矢量

%--------------------------------------------------------------------------
%   按照Y轴排布阵列
%--------------------------------------------------------------------------
array = [zeros(1,64);((1:64)-64/2-0.5).*d;zeros(1,64)];

%--------------------------------------------------------------------------
%   计算方向图
%--------------------------------------------------------------------------
[theta,E] = rt.array_pattern(array,lambda,w);                               %仿真实际上是按照射频电磁波

E = sum(E,2);

plot(theta,abs(E));xlim([-90 90]);grid on
title(['波束指向角-> ' num2str(w_angle) '° 信号频率-> '  num2str(fc,'%2.1e') 'Hz' ' 阵列设计-> ' num2str(fc_d,'%2.1e')  'Hz'])