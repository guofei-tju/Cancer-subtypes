function d = kernel_eucl(adjmat,dim)
mu_v = 0.005;gamma_v=0.002;
% Calculates the link indicator kernel from a graph adjacency by pairwise linear correlation coefficient
% 
%INPUT: 
% adjmat : binary adjacency matrix
% dim    : dimension (1 - rows, 2 - cols)
%OUTPUT:
% d : kernel matrix for adjmat over dimension 'dim'

 net_y = adjmat;
% Graph based kernel

%Gaussian random noise matrix
R = normrnd(mu_v,gamma_v,size(net_y));
%Add noise
net_y = net_y + R;

if dim == 1
    ga = squareform(pdist(net_y,'euclidean'));
else
    ga = squareform(pdist(net_y','euclidean'));
end
d=ga; 
[d,PS] = mapminmax(d,0,1); 
d=ones(size(ga))-d;
d=(d+d')/2;
end


