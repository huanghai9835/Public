f = @(x) x(1)^2+x(2)^3;
% ���� x=[2, 3]' �����ݶ�Ϊ�������⣩[4, 27]

% ������ֵ�����ķ�ʽ���ݶ�Ϊ��
computeNumericGradient(f, [2, 3]')