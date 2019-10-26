function C = clustering_pc(A, NC)
  [N,M] = size(A);
  C = zeros(NC,M);
  IC = 1;
  ZONES = zeros(N,1);
  for i = 1 : N
    ok = 1;
    for j = 1 : IC - 1
      if(A(i,:) == C(j,:))
        ok = 0;
      endif
    endfor
    if(ok == 1)
        C(IC++,:)  = A(i,:);
        ZONES(i) = IC - 1;
      endif
    if(IC - 1 == NC)
      break;
    endif
  endfor
  endOfA = 0;
  while(!endOfA)
    for i = 1 : N
      if(ZONES(i) == 0)
        zone = 1;
        distMin = norm(A(i,:) - C(zone,:));
        for j = 2 : NC
          dist = norm(A(i,:) - C(j,:));
          if(distMin > dist)
            distMin = dist;
            zone = j;
          endif
        endfor
        ZONES(i) = zone;
      endif
    endfor
    for i = 1 : NC
      MASSC = zeros(1,M);
      num = 0;
      for j = 1 : N
        if(ZONES(j) == i) 
          MASSC = MASSC + A(j,:);
          num = num + 1;
        endif
      endfor
     MASSC = MASSC / num;
     if(C(i,:) == MASSC)
      endOfA = 1;
     endif
     C(i,:) = MASSC;
    endfor
    ZONES = zeros(N,1);
  endwhile
endfunction
