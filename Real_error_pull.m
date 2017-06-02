[error_1, error_2, error_3, error_4, error_5, error_6, error_7, error_8,...
    error_9, error_10, error_11, error_12, error_13, error_14]...
    = textread('error_realtime.txt','%n %n %n %n %n %n %n %n %n %n %n %n %n %n','headerlines',1);

t = linspace(0,10,length(error_1));

plot(t,error_1, t,error_2, t,error_4, t,error_5, t,error_6, t,error_7, t,error_10, t, error_13)
legend('1','2', '4', '5', '6', '7','10','13')
