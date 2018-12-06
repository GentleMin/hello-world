function [ zeropt ] = bisection( func, left, right, prec )
%	二分法找非线性函数零点
%   输入4参数：函数句柄func，上/下界left/right，要求绝对精度prec
%   返回1参数：零点
leftVal = func(left);
rightVal = func(right);
if leftVal*rightVal >= 0        % 捕捉异常：若上下界处符号非相反
    BExcept = MException('InvalidBoundary', 'Function vals at the boundaries are of the same sign, bisection unable to continue!');
    throw(BExcept);
end
flag = 0;
while (right - left) > prec     % 当区间长度大于精度时
    mid = (left + right)/2;
    midVal = func(mid);
    if midVal == 0              % 若中点值恰好为零则直接得到该值
        zeropt = mid;
        flag = 1;
        break;
    end
    if midVal*leftVal < 0       % 否则找到取值与中点取值异号的端点，将该区间作为新的查找区间
        right = mid;
    else
        left = mid;
        leftVal = midVal;
    end
end
if flag == 0                    % 若由于区间长度满足精度而退出循环，则取区间中点为零点
    zeropt = (left + right)/2;
end
