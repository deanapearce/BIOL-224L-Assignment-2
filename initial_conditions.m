function [t, A, B] = initial_conditions(n)
  t = 0;
  % Initialize A to one
  A = ones(n);
  % Initialize B to zero which a clump of ones
  B = zeros(n);
  B(51:60 ,51:70) = 1;
  B(61:80,71:80) = 1;