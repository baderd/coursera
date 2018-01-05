function [logimat]=logiunpack(logicell)

% logicell = {[], [2, 3], []};

n = length(logicell);
logimat = zeros(n);

for i = 1:n
   tmp = logicell{i};
   if ~isempty(tmp)
       logimat(i, tmp) = 1;
   end
end

logimat = logical(logimat);
% logimat
