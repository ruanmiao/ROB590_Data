close all

[error_1, error_2, error_3, error_4, error_5, error_6, error_7, error_8,...
    error_9, error_10, error_11, error_12, error_13, error_14, error_15,...
    error_16, error_17, error_18, error_19, error_20, error_21, error_22,...
    error_23, error_24, error_25, error_26, error_27, error_28]...
    = textread('Along_D/error_realtime.txt',...
    '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n ',...
    'headerlines',1);

[constraint_1, constraint_2, constraint_3, constraint_4, constraint_5,...
    constraint_6, constraint_7, constraint_8, constraint_9, constraint_10,...
    constraint_11, constraint_12, constraint_13, constraint_14, constraint_15,...
    constraint_16, constraint_17, constraint_18, constraint_19, constraint_20,...
    constraint_21, constraint_22, constraint_23, constraint_24, constraint_25,...
    constraint_26, constraint_27, constraint_28]...
    = textread('Along_D/constraint_violation.txt',...
    '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n ',...
    'headerlines',1);

mean_error_D = [error_2, error_3, error_4, error_5, error_6, error_7, error_8,...
    error_9, error_10, error_11, error_12, error_13, error_14, error_15,...
    error_16, error_17, error_18, error_19, error_20, error_21, error_22,...
    error_23, error_24, error_25, error_26, error_27, error_28];
mean_error_D = mean(mean_error_D,2);

constraint_D = [constraint_1, constraint_2, constraint_3, constraint_4, constraint_5,...
    constraint_6, constraint_7, constraint_8, constraint_9, constraint_10,...
    constraint_11, constraint_12, constraint_13, constraint_14, constraint_15,...
    constraint_16, constraint_17, constraint_18, constraint_19, constraint_20,...
    constraint_21, constraint_22, constraint_23, constraint_24, constraint_25,...
    constraint_26, constraint_27, constraint_28];
constraint_D = mean(constraint_D,2);

begin = 90;
t_D = linspace(0,length(error_1)-1,length(error_1));

ind_D = find(error_2);
ind_D = ind_D(begin:end);

t_D = t_D(ind_D);
t_D = t_D-ones(size(t_D))*t_D(1);

mean_error_D = mean(mean_error_D,2);
figure
plot(t_D,mean_error_D(ind_D))


figure
plot(t_D,error_7(ind_D), t_D,error_9(ind_D), t_D,error_11(ind_D),...
    t_D,error_13(ind_D), t_D, error_15(ind_D), t_D,error_17(ind_D),...
    t_D,error_18(ind_D), t_D,error_20(ind_D), t_D,error_22(ind_D),...
    t_D,error_24(ind_D), t_D, error_26(ind_D), t_D,error_27(ind_D),...
    t_D,error_28(ind_D), t_D,mean_error_D(ind_D),'*')
legend('7', '9', '11','13','15','17','18','20','22',...
    '24', '26', '27', '28','mean')
title('Predicted p dot error for old model')
xlabel('t step')
ylabel('Meter')

figure

plot(t_D,constraint_7(ind_D), t_D,constraint_9(ind_D), t_D,constraint_11(ind_D),...
    t_D, constraint_13(ind_D), t_D,constraint_15(ind_D),t_D,constraint_17(ind_D),...
    t_D, constraint_18(ind_D), t_D,constraint_20(ind_D), t_D,constraint_22(ind_D),...
    t_D,constraint_24(ind_D), t_D,constraint_26(ind_D), t_D,constraint_27(ind_D),... 
    t_D, constraint_28(ind_D), t_D,constraint_D(ind_D), '*')
legend('7', '9', '11','13','15','17','18','20','22',...
    '24', '26', '27', '28','mean')
title('constraint violation')

