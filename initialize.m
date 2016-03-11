% - initialize the 4 way intersection including crosswalks.
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: initialize.m
%}

function initialize(ljHl)
    % Identifiers used in funtion
    global CNS_RED;      % NS crosswalk red
    global CNS_WHT;      % NS crosswalk white
    global CEW_RED;      % EW crosswalk red
    global CEW_WHT;      % EW corsswalk white
    global TNS_GRN;      % NS turn lane green
    global TNS_YLW;      % NS turn lane yellow
    global TNS_RED;      % NS turn lane red
    global FNS_GRN;      % NS forward lane green
    global FNS_YLW;      % NS forward lane yellow
    global FNS_RED;      % NS forward lane red
    global TEW_GRN;      % EW turn lane green
    global TEW_YLW;      % EW turn lane yellow
    global TEW_RED;      % EW turn lane red
    global FEW_GRN;      % EW forward lane green
    global FEW_YLW;      % EW forward lane yellow
    global FEW_RED;      % EW forward lane red
    global CNS_BUT;       % NS button switch
    global CEW_BUT;       % EW button switch
    global HIGH;
    global LOW;


    %power on all red lights, errMsg checks the errno flag.
    digiWrite(ljHl, CNS_RED, HIGH); % NS crosswalk    red
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
    digiWrite(ljHl, CNS_BUT,  LOW);  % Ensure low voltage on lj side
    digiWrite(ljHl, CEW_BUT,  LOW);  % Ensurel low voltage on lj side
end
