% - changes the states of the given street directions lights
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: crossLights.m
%}

% state defines wether to send the crosswalk lights GREEN or RED
function crossLights(ljHl, streetDirection, state)
    global CNS_RED;
    global CNS_WHT;
    global CEW_RED;
    global CEW_WHT;
    global HIGH;
    global LOW;
    global GREEN;
    global NS;
    if(streetDirection == NS)
        if(state == GREEN)
            digiWrite(ljHl, CNS_RED, LOW);  % NS crosswalk red
            digiWrite(ljHl, CNS_WHT, HIGH); % NS crosswalk white 
        else % set RED
            digiWrite(ljHl, CNS_WHT, LOW);  % NS crosswalk white 
            digiWrite(ljHl, CNS_RED, HIGH); % NS crosswalk red
        end
    else % change EW
        if(state == GREEN)
            digiWrite(ljHl, CEW_RED, LOW);  % EW crosswalk red
            digiWrite(ljHl, CEW_WHT, HIGH); % EW crosswalk white
        else % set RED
            digiWrite(ljHl, CEW_WHT, LOW);  % EW crosswalk white 
            digiWrite(ljHl, CEW_RED, HIGH); % EW crosswalk red
        end
    end
end
