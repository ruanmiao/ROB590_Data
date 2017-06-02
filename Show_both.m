close all

figure
plot(t_D,mean_error_D(ind_D),'r',t_D,mean_error((ind_D)),'b')
figure
plot(t_D,mean_error((ind_D)),'b', t_D,mean_error_D(ind_D),'r')
legend('New Model', 'Previous Model')
title('p dot error of New Model and Previous Model')
xlabel('t step')
ylabel('Meter')

figure
plot(t,mean_error_D(ind),'r',t,mean_error(ind),'b')
figure
plot(t,mean_error(ind),'b', t,mean_error_D(ind),'r')
legend('New Model', 'Previous Model')
title('p dot error of New Model and Previous Model')
xlabel('t step')
ylabel('Meter')
