function [ logicell ] = logipack( logimat )
%LOGIPACK Summary of this function goes here
%   Detailed explanation goes here

% logimat = [1 0 0; 0 0 0; 0 1 0];

n = size(logimat,1);
logicell = cell(n,1);

for i = 1:n
   tmp = logimat(i,:);
   idx = find(tmp);
   if ~isempty(idx)
      logicell{i} = idx; 
   end
end

logicell;
