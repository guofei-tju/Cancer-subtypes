load('data.mat')
%tju cs for bioinformatics
data1 = gene;
% data1=gene(list_num,:);
data2 = isoform;
data3 = miRNA;

data1 = zscore(data1);
data2 = zscore(data2);
data3 = zscore(data3);


W1 = kernel_eucl(data1,2);  
W2 = kernel_eucl(data2,2);  
W3 = kernel_eucl(data3,2); 

K = 30;%number of neighbors, usually (10~30)
alpha = 0.9; %hyperparameter, usually (0.3~0.8)
T = 20; %Num

W = SKF({W1,W2,W3}, K, T,alpha);
 
C = 5; %The number of clusters
group = SpectralClustering(W,C);
