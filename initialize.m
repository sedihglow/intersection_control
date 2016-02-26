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
    digiWrite(ljHL,  0, HIGH); % NS crosswalk    red
    digiWrite(ljHl,  2, HIGH); % EW crosswalk    red
    digiWrite(ljHl,  8, HIGH); % NS turn lane    red
    digiWrite(ljHl, 11, HIGH); % NS forward lane red
    digiWrite(ljHl, 14, HIGH); % EW turn lane    red
    digiWrite(ljHl, 17, HIGH); % EW forward lane red

    % turn off all other lights in case they are on... probably wouldnt be tho.
    digiWrite(ljHl,  1, LOW); % NS crosswalk    white 
    digiWrite(ljHl,  3, LOW); % EW crosswalk    white
    digiWrite(ljHl,  6, LOW); % NS turn lane    green
    digiWrite(ljHl,  7, LOW); % NS turn lane    yellow
    digiWrite(ljHl,  9, LOW); % NS forward lane green
    digiWrite(ljHl, 10, LOW); % NS forward lane yellow
    digiWrite(ljHl, 12, LOW); % EW turn lane    green
    digiWrite(ljHl, 13, LOW); % EW turn lane    yellow
    digiWrite(ljHl, 15, LOW); % EW forward lane green
    digiWrite(ljHl, 16, LOW); % EW forward lane yellow
end
