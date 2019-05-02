function rowOfData = returnRow(myTable, row )
%returnRow - return a single row from a 2d array
%   
%    assuming input myTable has N rows and as many
%    columns as we want, return the "row" the user asks for
%
%
% ds - 2019-05-01, for the matlab course

rowOfData = myTable( row , :);

end

