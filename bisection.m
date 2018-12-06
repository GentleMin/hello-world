function [ zeropt ] = bisection( func, left, right, prec )
%	���ַ��ҷ����Ժ������
%   ����4�������������func����/�½�left/right��Ҫ����Ծ���prec
%   ����1���������
leftVal = func(left);
rightVal = func(right);
if leftVal*rightVal >= 0        % ��׽�쳣�������½紦���ŷ��෴
    BExcept = MException('InvalidBoundary', 'Function vals at the boundaries are of the same sign, bisection unable to continue!');
    throw(BExcept);
end
flag = 0;
while (right - left) > prec     % �����䳤�ȴ��ھ���ʱ
    mid = (left + right)/2;
    midVal = func(mid);
    if midVal == 0              % ���е�ֵǡ��Ϊ����ֱ�ӵõ���ֵ
        zeropt = mid;
        flag = 1;
        break;
    end
    if midVal*leftVal < 0       % �����ҵ�ȡֵ���е�ȡֵ��ŵĶ˵㣬����������Ϊ�µĲ�������
        right = mid;
    else
        left = mid;
        leftVal = midVal;
    end
end
if flag == 0                    % ���������䳤�����㾫�ȶ��˳�ѭ������ȡ�����е�Ϊ���
    zeropt = (left + right)/2;
end
