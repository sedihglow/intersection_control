% - initialize the 4 way intersection including crosswalks.
%{
    James Ross
    name 2
    name 3

    filename: initialize.m
%}

function initialize(ljHl)
    % I wish matlab had #defines.
    HIGH = 1;
    LOW  = 0;

    % power on all red lights, errMsg checks the errno flag.
    digiWriteToPin(ljHL,  0, HIGH); % NS crosswalk    red
    digiWriteToPin(ljHl,  2, HIGH); % EW crosswalk    red
    digiWriteToPin(ljHl,  8, HIGH); % NS turn lane    red
    digiWriteToPin(ljHl, 11, HIGH); % NS forward lane red
    digiWriteToPin(ljHl, 14, HIGH); % EW turn lane    red
    digiWriteToPin(ljHl, 17, HIGH); % EW forward lane red

    % turn off all other lights in case they are on... probably wouldnt be tho.
    digiWriteToPin(ljHl,  1, LOW); % NS crosswalk    white 
    digiWriteToPin(ljHl,  3, LOW); % EW crosswalk    white
    digiWriteToPin(ljHl,  6, LOW); % NS turn lane    green
    digiWriteToPin(ljHl,  7, LOW); % NS turn lane    yellow
    digiWriteToPin(ljHl,  9, LOW); % NS forward lane green
    digiWriteToPin(ljHl, 10, LOW); % NS forward lane yellow
    digiWriteToPin(ljHl, 12, LOW); % EW turn lane    green
    digiWriteToPin(ljHl, 13, LOW); % EW turn lane    yellow
    digiWriteToPin(ljHl, 15, LOW); % EW forward lane green
    digiWriteToPin(ljHl, 16, LOW); % EW forward lane yellow
end
