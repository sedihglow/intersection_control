% - initialize the 4 way intersection including crosswalks.
%{
    James Ross
    name 2
    name 3

    filename: initialize.m
%}

function initialize(ljHl)
    % power on all red lights, errMsg checks the errno flag.
    digiWrite(ljHL, CNS_RED, HIGH); % NS crosswalk    red
    digiWrite(ljHl, CEW_RED, HIGH); % EW crosswalk    red
    digiWrite(ljHl, TNS_RED, HIGH); % NS turn lane    red
    digiWrite(ljHl, FNS_RED, HIGH); % NS forward lane red
    digiWrite(ljHl, TEW_RED, HIGH); % EW turn lane    red
    digiWrite(ljHl, FEW_RED, HIGH); % EW forward lane red

    % turn off all other lights in case they are on
    digiWrite(ljHl, CNS_WHT, LOW);  % NS crosswalk    white 
    digiWrite(ljHl, CEW_WHT, LOW);  % EW crosswalk    white
    digiWrite(ljHl, TNS_GRN, LOW);  % NS turn lane    green
    digiWrite(ljHl, TNS_YLW, LOW);  % NS turn lane    yellow
    digiWrite(ljHl, FNS_GRN, LOW);  % NS forward lane green
    digiWrite(ljHl, FNS_YLW, LOW);  % NS forward lane yellow
    digiWrite(ljHl, TEW_GRN, LOW);  % EW turn lane    green
    digiWrite(ljHl, TEW_YLW, LOW);  % EW turn lane    yellow
    digiWrite(ljHl, FEW_GRN, LOW);  % EW forward lane green
    digiWrite(ljHl, FEW_YLW, LOW);  % EW forward lane yellow
end
