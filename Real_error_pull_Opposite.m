%close all

[error_1, error_2, error_3, error_4, error_5, error_6, error_7, error_8,...
    error_9, error_10, error_11, error_12, error_13, error_14, error_15,...
    error_16, error_17, error_18, error_19, error_20, error_21, error_22,...
    error_23, error_24, error_25, error_26, error_27, error_28]...
    = textread('Opposite/error_realtime.txt',...
    '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n ',...
    'headerlines',1);

[constraint_1, constraint_2, constraint_3, constraint_4, constraint_5,...
    constraint_6, constraint_7, constraint_8, constraint_9, constraint_10,...
    constraint_11, constraint_12, constraint_13, constraint_14, constraint_15,...
    constraint_16, constraint_17, constraint_18, constraint_19, constraint_20,...
    constraint_21, constraint_22, constraint_23, constraint_24, constraint_25,...
    constraint_26, constraint_27, constraint_28]...
    = textread('Opposite/constraint_violation.txt',...
    '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n ',...
    'headerlines',1);

mean_error = [error_2, error_3, error_4, error_5, error_6, error_7, error_8,...
    error_9, error_10, error_11, error_12, error_13, error_14, error_15,...
    error_16, error_17, error_18, error_19, error_20, error_21, error_22,...
    error_23, error_24, error_25, error_26, error_27, error_28];
mean_error = mean(mean_error,2);

constraint = [constraint_1, constraint_2, constraint_3, constraint_4, constraint_5,...
    constraint_6, constraint_7, constraint_8, constraint_9, constraint_10,...
    constraint_11, constraint_12, constraint_13, constraint_14, constraint_15,...
    constraint_16, constraint_17, constraint_18, constraint_19, constraint_20,...
    constraint_21, constraint_22, constraint_23, constraint_24, constraint_25,...
    constraint_26, constraint_27, constraint_28];
constraint = mean(constraint,2);

begin = 50;
t = linspace(0,length(error_1)-1,length(error_1));

ind = find(error_2);
ind = ind(begin:end);

t = t(ind);
t = t-ones(size(t))*t(1);

mean_error = mean(mean_error,2);
figure
plot(t,mean_error(ind))


figure
plot(t,error_7(ind), t,error_9(ind), t,error_11(ind),...
    t,error_13(ind), t, error_15(ind), t,error_17(ind),...
    t,error_18(ind), t,error_20(ind), t,error_22(ind),...
    t,error_24(ind), t, error_26(ind), t,error_27(ind),...
    t,error_28(ind), t,mean_error(ind),'*')
legend('7', '9', '11','13','15','17','18','20','22',...
    '24', '26', '27', '28','mean')
title('Predicted p dot error for new model')
xlabel('t step')
ylabel('Meter')

figure

plot(t,constraint_7(ind), t,constraint_9(ind), t,constraint_11(ind),...
    t, constraint_13(ind), t,constraint_15(ind),t,constraint_17(ind),...
    t, constraint_18(ind), t,constraint_20(ind), t,constraint_22(ind),...
    t,constraint_24(ind), t,constraint_26(ind), t,constraint_27(ind),... 
    t, constraint_28(ind), t,constraint(ind), '*')
legend('7', '9', '11','13','15','17','18','20','22',...
    '24', '26', '27', '28','mean')
title('constraint violation')
