%%In His Exalted Name
%
%Session2
%
%Written by: Fatemeh Fallah
%
%fh.fallah90@gmail.com
%
%
%% Conditionals-Function
function doLoop2_for()
%do a loop

listOfPeople = {'Fred','Mary','Laura'};

for i = 1:length(listOfPeople)
	name = listOfPeople{i};
	fprintf('Person number %d is %s\n',i,name);
end
