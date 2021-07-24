%%In His Exalted Name
%
%Session2
%
%Written by: Fatemeh Fallah
%
%fh.fallah90@gmail.com
%
%
%% Debugging
function debugDemo(subjectCode)
%Print out the condition associated with the subject
mySubjects={'SB01','SB02','SB03'};
myConditions={'D','T','D'};
myData={mySubjects,myConditions};

subjectindex=find(strcmp(mySubjects,subjectCode));
myConditions=myData{2}(subjectindex);

printSomething(myConditions);
%we are calling another function that we defined in the same file.
end

function printSomething(stringToPrint)
%All this does is print out the string that is passed to it.

fprintf('This is your string:%s\n',stringToPrint);
end
