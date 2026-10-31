# parameters
param m integer > 0;
param k > 0;
param d{1..m, 1..m} >= 0;

# variable
var x{1..m, 1..m} binary;

# objective function
minimize f: sum{i in 1..m, j in 1..m} d[i, j] * x[i, j];

# constraints
subject to 1_cluster{i in 1..m}: sum{j in 1..m} x[i, j] = 1;
subject to k_clusters: sum{j in 1..m} x[j, j] = k;
subject to j_cluster{i in 1..m, j in 1..m}: x[i, j] <= x[j, j];
