function [t, A, B] = initial_conditions_modified(n)
  t = 0; % set time to 0
  % Initialize A to one
  A = ones(n);
  % Initialize B to zero
  B = zeros(n);
  % create clumps of B
  B(51:60 ,51:70) = 1; % 51<y<60; 51<x<70
  B(61:80,71:80) = 1; % 61<y<80; 71<x<80
  % add addtl B positions
  B(21:30, 41:61) =1;
  B(19:20, 34:75) =1;
  %effect: final output appears different, but is broadly similar to orig in concept, as the way the pattern is generated has not been changed.