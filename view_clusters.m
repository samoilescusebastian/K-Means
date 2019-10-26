function retval = view_clusters (A, C)
[N, M] = size(A);
[NC,MC] = size(C);
ZONES = zeros(N,1);
for i = 1 : N
  zone = 1;
  minDistance = norm(A(i,:) - C(zone,:));
  for j = 2 : NC 
    distance = norm(A(i,:) - C(j,:));
    if(minDistance > distance)
      minDistance = distance;
      zone = j;
    endif
  endfor
  ZONES(i) = zone;
endfor
for i = 1 : NC 
  PO = zeros(N,M);
  nP = 1;
  for j = 1 : N
    if(i == ZONES(j))
      PO(nP++,:) = A(j,:);
    endif
  endfor
  scatter3(PO(1:nP-1,1), PO(1:nP-1,2), PO(1:nP-1,3),"filled");
  hold on;
endfor
hold off;
endfunction
