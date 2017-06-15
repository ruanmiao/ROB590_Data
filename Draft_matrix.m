clear all
I = eye(3);

num_nodes = 3;
num_grippers = 1;
J = zeros(num_nodes*3,num_grippers*6);

for i=1:num_nodes
    for j=1:num_grippers
       J(3*(i-1)+1:3*(i-1)+3,6*(j-1)+1:6*(j-1)+3) = I;
       J(3*(i-1)+1:3*(i-1)+3,6*(j-1)+4:6*(j-1)+6) = I*(2*j+i);         
    end
end

