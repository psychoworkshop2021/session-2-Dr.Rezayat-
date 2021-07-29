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

function fruit = pickAFruit(color,fruitsize)
% choose a fruit based on color and size
% color is a string, and size is a double representing weight in grams

if strcmp(color,'red')

	if fruitsize < 10
		fruit = 'apple';
	else
		fruit = 'watermelon';
	end
		

elseif strcmp(color,'yellow')

	fruit = 'banana';

else

	fruit = 'unknown';

end

end
