function [t, A, B] = initial_conditions(n)
  t = 0; % set time to 0
  % Initialize A to one
  A = ones(n);
  % Initialize B to zero
  B = zeros(n);
  % create clumps of B
  B(51:60 ,51:70) = 1; % 51<y<60; 51<x<70
  B(61:80,71:80) = 1; % 61<y<80; 71<x<80