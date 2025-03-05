function design = vector2designstruct(p, wid)
% Converts a gene vector into a design struct
% for snakeraven
m = length(p)/3;
%design.m = m;
design.alpha = zeros(1,m);
design.n = zeros(1,m);
design.d = zeros(1,m);
design.w = wid*ones(1,m); % width is now an input. This was previously hardcoded to w = 4

for ii = 1:m
    design.alpha(ii) = p((ii-1)*3 + 1);
    design.n(ii) = p((ii-1)*3 + 2);
    design.d(ii) = p((ii-1)*3 + 3);
end

end