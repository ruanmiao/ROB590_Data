%close all
close all
clear all

space_hold_28 = '%n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n %n  %n %n %n %n';
space_hold_1 = '%n';

%%%%%%%%%%% Error Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%file_constraint_D = 'Towards/constraint_violation.txt';
file_constraint_D = 'Towards_parameter/towardsD_20_3_20/constraint_violation.txt';
file_constraint_1 = 'Towards_parameter/towards_20_3_20/constraint_violation.txt';
file_constraint_2 = 'Towards_parameter/towards_20000_4_7_O2-0_r005/constraint_violation.txt';
file_constraint_3 = 'Towards_parameter/towards_20000_4_7/constraint_violation.txt';

file_t_D = 'Towards_parameter/towardsD_20_3_20/time_test.txt';
file_t_1 = 'Towards_parameter/towards_20_3_20/time_test.txt';
file_t_2 = 'Towards_parameter/towards_20000_4_7_O2-0_r005/time_test.txt';
file_t_3 = 'Towards_parameter/towards_20000_4_7/time_test.txt';

%parameter_set_D = 'D';
parameter_set_D = 'old model';
parameter_set_1 = '20,3,20';
parameter_set_2 = '20000,4,7, resolution: 0.005';
parameter_set_3 = '20000,4,7, resolution: 0.025';

constraint_D = readData_fn(file_constraint_D, space_hold_28);
constraint_1 = readData_fn(file_constraint_1, space_hold_28);
constraint_2 = readData_fn(file_constraint_2, space_hold_28);
constraint_3 = readData_fn(file_constraint_3, space_hold_28);

mean_constraint_D = mean(constraint_D,2);
mean_constraint_1 = mean(constraint_1,2);
mean_constraint_2 = mean(constraint_2,2);
mean_constraint_3 = mean(constraint_3,2);

t_D = readTime(file_t_D);
t_1 = readTime(file_t_1);
t_2 = readTime(file_t_2);
t_3 = readTime(file_t_3);

ind_D = 1:length(t_D);

%{
ind_D = find(constraint_D(:,2));
ind_1 = find(constraint_1(:,2));
ind_2 = find(constraint_2(:,2));
ind_3 = find(constraint_3(:,2));

mean_error_D = raw_mean_constraint_D(ind_D);
mean_error_1 = raw_mean_constraint_1(ind_1);
mean_error_2 = raw_mean_constraint_2(ind_2);
mean_error_3 = raw_mean_constraint_3(ind_3);

t_D = raw_t_D(ind_D);
t_1 = raw_t_1(ind_1);
t_2 = raw_t_2(ind_2);
t_3 = raw_t_3(ind_3);
%}
%%%%%%%%%%%%%%%%%%%%%% select the parameter set showing whole data %%%%
show_constraint = constraint_1;
show_t = t_1;
show_ind = 1:length(t_1);
show_legend = parameter_set_1;

%%%%%%%%%%%%%%%%%%%%%% Show all in one plot

figure
plot(show_t,show_constraint(show_ind,3), show_t,show_constraint(show_ind,5),...
    show_t,show_constraint(show_ind,7), show_t,show_constraint(show_ind,9),...
    show_t,show_constraint(show_ind,11), show_t,show_constraint(show_ind,12),...
    show_t,show_constraint(show_ind,13), show_t,show_constraint(show_ind,14),...
    show_t,show_constraint(show_ind,16), show_t,show_constraint(show_ind,18),...
    show_t,show_constraint(show_ind,19), show_t,show_constraint(show_ind,20),...
    show_t,show_constraint(show_ind,22), show_t,show_constraint(show_ind,24),...
    show_t,show_constraint(show_ind,26), show_t,show_constraint(show_ind,28)) 
legend('3', '5','7', '9', '11', '12' ,'13','14','16','18', '19', '20','22',...
    '24', '26', '28')
title('Predicted p dot constraint for new model.')
xlabel('t')
ylabel('abs-cosine between p dot and surface normal')


%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
%{
figure
plot(show_t,show_constraint(show_ind,3), show_t,show_constraint(show_ind,4),...
    show_t,show_constraint(show_ind,5), show_t,show_constraint(show_ind,6),...
    show_t,show_constraint(show_ind,7), show_t,show_constraint(show_ind,8))
legend('3','4','5','6','7','8')
title('Predicted p dot error for new model. 1')
xlabel(show_legend)
ylabel('Meter')

figure
plot(show_t,show_constraint(show_ind,8), show_t,show_constraint(show_ind,9),...
    show_t,show_constraint(show_ind,10), show_t,show_constraint(show_ind,11),...
    show_t,show_constraint(show_ind,12), show_t,show_constraint(show_ind,13))
legend('8','9','10','11','12','13')
title('Predicted p dot constarint for new model. 2')
xlabel(show_legend)
ylabel('Meter')


figure
plot(show_t,show_error(show_ind,13), show_t,show_error(show_ind,14),...
    show_t,show_error(show_ind,15), show_t,show_error(show_ind,16),...
    show_t,show_error(show_ind,17), show_t,show_error(show_ind,18)) 
legend('13','14','15','16','17','18')
title('Predicted p dot error for new model. 3')
xlabel(show_legend)
ylabel('Meter')

figure
plot(show_t,show_error(show_ind,18),...
    show_t,show_error(show_ind,19), show_t,show_error(show_ind,20),...
    show_t,show_error(show_ind,22), show_t,show_error(show_ind,24),...
    show_t,show_error(show_ind,26), show_t,show_error(show_ind,28)) 
legend('18','19', '20','22',...
    '24', '26', '28')
title('Predicted p dot error for new model. 4')
xlabel(show_legend)
ylabel('Meter')
%}
%%%%%%%%%%%%%%%%%%%%%%% End of showing mutiple plots %%%%%%%%%%%%%%%5


figure
plot(t_D, mean_constraint_D, t_1, mean_constraint_1, t_2, mean_constraint_2, ...
    t_3, mean_constraint_3)
legend(parameter_set_D, parameter_set_1, parameter_set_2, parameter_set_3)
title('mean constraint with paramters pool')
xlabel('t step')
ylabel('Meter')

figure
plot(t_D, mean_constraint_D, t_1, mean_constraint_1)
legend(parameter_set_D, parameter_set_1)
title('mean constraint with paramters pool')
xlabel('t step')
ylabel('Mean constraint violation (in cosine)')



%%%%%%%%%%%%%%%%%%%%%% Show all in one plot, for D

figure
plot(t_D,constraint_D(ind_D,3), t_D,constraint_D(ind_D,5),...
    t_D,constraint_D(ind_D,7), t_D,constraint_D(ind_D,9),...
    t_D,constraint_D(ind_D,11), t_D,constraint_D(ind_D,12),...
    t_D,constraint_D(ind_D,13), t_D,constraint_D(ind_D,14),...
    t_D,constraint_D(ind_D,16), t_D,constraint_D(ind_D,18),...
    t_D,constraint_D(ind_D,19), t_D,constraint_D(ind_D,20),...
    t_D,constraint_D(ind_D,22), t_D,constraint_D(ind_D,24),...
    t_D,constraint_D(ind_D,26), t_D,constraint_D(ind_D,28)) 
legend('3', '5','7', '9', '11', '12' ,'13','14','16','18', '19', '20','22',...
    '24', '26', '28')
title('Predicted p dot constraint for new model. D')
xlabel(parameter_set_D)
ylabel('Meter')


%%%%%%%%%%%%%%%%%%%% show all in two plots: %%%%%%%%%%%%%%%%%%
%{
figure
plot(t_D,constraint_D(ind_D,3), t_D,constraint_D(ind_D,4),...
    t_D,constraint_D(ind_D,5), t_D,constraint_D(ind_D,6),...
    t_D,constraint_D(ind_D,7), t_D,constraint_D(ind_D,8))
legend('3','4','5','6','7','8')
title('Predicted p dot constraint for new model. D1')
xlabel(parameter_set_D)
ylabel('Meter')

figure
plot(t_D,constraint_D(ind_D,8), t_D,constraint_D(ind_D,9),...
    t_D,constraint_D(ind_D,10), t_D,constraint_D(ind_D,11),...
    t_D,constraint_D(ind_D,12), t_D,constraint_D(ind_D,13))
legend('8','9','10','11','12','13')
title('Predicted p dot constarint for new model. D2')
xlabel(parameter_set_D)
ylabel('Meter')



figure
plot(t_D,constraint_D(ind_D,13), t_D,constraint_D(ind_D,14),...
    t_D,constraint_D(ind_D,15), t_D,constraint_D(ind_D,16),...
    t_D,constraint_D(ind_D,17), t_D,constraint_D(ind_D,18)) 
legend('13','14','15','16','17','18')
title('Predicted p dot constraint for new model. D3')
xlabel(parameter_set_D)
ylabel('Meter')

figure
plot(t_D,constraint_D(ind_D,18),...
    t_D,constraint_D(ind_D,19), t_D,constraint_D(ind_D,20),...
    t_D,constraint_D(ind_D,22), t_D,constraint_D(ind_D,24),...
    t_D,constraint_D(ind_D,26), t_D,constraint_D(ind_D,28)) 
legend('18','19', '20','22',...
    '24', '26', '28')
title('Predicted p dot constraint for new model. D4')
xlabel(parameter_set_D)
ylabel('Meter')
%}
%%%%%%%%%%%%%%%%%%%%%%% End of showing mutiple plots for D %%%%%%%%%%%%%%%5



