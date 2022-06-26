%--------------------------------------------------------------------------
%   word抗干扰
%   输入:
%   N               阵元数
%   theta_tgt       波束指向 度
%   window_N        指向加窗
%   lambda          波长
%   position        阵列坐标
%   theta_jam       干扰来向
%   beta            控制系数 -∞~1   1 保持不变 0 垂直零陷
%--------------------------------------------------------------------------
%   example:
%   N = 64; 
%   lambda = 1;                                                             %波长
%   dd = lambda/2;                                                          %阵元间距d = lambda/2
%   d = 0:dd:(N-1)*dd;                                                      %构建阵列坐标
%   W= word( N, 0,@taylorwin, lambda, d, theta_jam,beta);                   %生成权系数
%--------------------------------------------------------------------------
function  W = word(N, theta_tgt, window_N, lamda, position, theta_jam,beta)
%--------------------------------------------------------------------------
%   指向角的导向矢量
%--------------------------------------------------------------------------
As = window_N(N).* ...
     exp(1j*2*pi*position*sind(theta_tgt)/lamda).'; 
 
%--------------------------------------------------------------------------
%   生成单位阵
%--------------------------------------------------------------------------
I = eye( N);

Ai = [];                                                                    %干扰来向存储
for idx = 1:length(theta_jam)
    %----------------------------------------------------------------------
    %   干扰来向的导向矢量 展宽  
    %   对干扰来向展宽 ±0.2度 形成导向矢量
    %   按照列 右侧堆叠
    %----------------------------------------------------------------------
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx))/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)+ 2)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)- 2)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)+ 1)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)- 1)/ lamda).'];
    
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)+ 3)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)- 3)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)+ 4)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)- 4)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)- 5)/ lamda).'];
    Ai = [Ai exp( 1j* 2* pi* position* sind( theta_jam(idx)+ 5)/ lamda).'];
end
%--------------------------------------------------------------------------
%   干扰来向构造矩阵
%--------------------------------------------------------------------------
P = Ai*( Ai'* Ai)^-1*Ai';
P_v =  I - P; 
w = P*As;
w_v = P_v*As;
W = [w_v w]*[1 beta]';
W = W/sqrt( W'* W);                                                         %归一化
