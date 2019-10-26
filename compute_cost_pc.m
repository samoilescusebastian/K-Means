function cost = compute_cost_pc(A, C)
  cost = 0;
  [NC,MC] = size(C);
  [NA,MA] = size(A);
  for i = 1 : NA
    minDistance = norm(A(i,:) - C(1,:));
    for j = 2 : NC 
      distance = norm(A(i,:) - C(j,:));
      if(minDistance > distance)
        minDistance = distance;
      endif
    endfor
    cost = cost + minDistance;
  endfor
endfunction

