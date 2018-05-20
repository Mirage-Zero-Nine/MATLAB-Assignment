function matrix = CheckerBoardFilter(num, Radius)

% NxN matrix
matrix = zeros(num);

% Convert coord
central = num / 2;

% Find bound
for i = 1:num
    if i > central
        coordI = i - num - 1;
    else
        coordI = i - 1;
    end
    for j = 1:num
        if j > central
            coordJ = j - num - 1;
        else
            coordJ = j - 1;
        end
        % matrix (i,j) 
        distance = max(abs(coordI), abs(coordJ));
        if distance < Radius
            matrix(i,j) = 255;
        else
            matrix(i,j) = 0;
        end
    end
end


