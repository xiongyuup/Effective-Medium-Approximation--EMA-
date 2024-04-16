function PS=PD(kesei1,kesei2,f1)


% 输出解
% a=-2-2*(1-f1)/f1;
% b=2*(1-f1)*kesei1/f1+kesei2-kesei1;
% c=(1-f1)/f1*kesei1*kesei2;

% x=-2-2*f1/(1-f1);
% y=f1/(1-f1)*(2*kesei1-kesei2)+2*kesei2-kesei1;
% z=(f1/(1-f1+1))*kesei1*kesei2;
% solution = roots([x, y, z]);



l=2*(1-f1)+2*f1;
m=(1-f1)*kesei1-2*(1-f1)*kesei2-2*f1*kesei1+f1*kesei2;
n=-f1*kesei1*kesei2-(1-f1)*kesei1*kesei2;

% y=f1/(1-f1)*(2*kesei1-kesei2)+2*kesei2-kesei1;
% z=(f1/(1-f1+1))*kesei1*kesei2;
% solution = roots([x, y, z]);

% 输出解
% disp('方程的解为：');
% disp(solution);
% solution = roots([a ,b, c]);
% disp(solution);
solution = roots([l ,m, n]);
if real(solution(1))>0
    PS=solution(1);
else
    PS=solution(2);
end
% disp(solution);