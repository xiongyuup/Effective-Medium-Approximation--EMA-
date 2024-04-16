function keseieff= MG(kesei1,kesei2,f)

%%%%%%%%%%%%kesei1为背景
y=(kesei2-kesei1)/(kesei2+2*kesei1);
keseieff=(1+2*f*y)/(1-f*y)*kesei1;
