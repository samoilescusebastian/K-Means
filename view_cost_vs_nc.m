function view_cost_vs_nc (file_name_1)
A = dlmread(file_name_1);
PO = zeros(10,1);
for i = 1 : 10
  C = clustering_pc(A,i);
  PO(i,1) = compute_cost_pc(A,C);
endfor
plot(1:10,PO(:,1));
endfunction
