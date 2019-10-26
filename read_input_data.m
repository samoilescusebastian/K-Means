function [NC,A] = read_input_data (file_name_1, file_name_2)
file_1 = fopen(file_name_1,"r");
file_2 = fopen(file_name_2, "r");
NC = fscanf(file_1, "%d");
A = dlmread(file_name_2,' ',5,0);
fclose(file_1);
fclose(file_2);
endfunction
