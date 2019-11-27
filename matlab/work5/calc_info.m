## Author:  <yaroslav@arch>
## Created: 2019-11-27

function [b,n] = calc_info(msg, alph, alph_p)
  len_alph = length(alph);
  len_alph_p = length(alph_p);
  len_msg = length(msg);
  if len_alph ~= len_alph_p;
    error("alph и alph_p имеют разную длину: %d != %d", length(alph), length(alph_p))
  endif
  
  b=0;
  for i=1:len_msg
    c=false;
    for j=1:len_alph
      if msg(i)==alph(j)
        %%printf("%s-%s    %d-%d\n", msg(i), alph(j), i, j)
        c=true;
        b -= log(alph_p(j));
        break  
      endif
    endfor
    if ~c 
      warning("Символ '%s' на месте %d в msg не найден в алфавите", msg(i), i)
    endif
  endfor
  
  n = length(msg)*log2(length(alph));
endfunction
