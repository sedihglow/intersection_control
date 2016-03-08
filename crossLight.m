% - changes the states of the given street directions lights
%{
    James Ross
    name 2
    name 3

    filename: crossLights.m
%}

% state defines wether to send the crosswalk lights HIGH or LOW
function crossLights(ljHl, streetDirection, state)
    if(streetDirection == NS)
        if(state == HIGH)
            digiWrite(ljHl, CNS_RED, LOW);  % NS crosswalk red
            digiWrite(ljHl, CNS_WHT, HIGH); % NS crosswalk white 
        else % set LOW
            digiWrite(ljHl, CNS_WHT, LOW);  % NS crosswalk white 
            digiWrite(ljHl, CNS_RED, HIGH); % NS crosswalk red
        end;end;
    else % change EW
        if(state == HIGH)
            digiWrite(ljHlm CEW_RED, LOW);  % EW crosswalk red
            digiWrite(ljHl, CEW_WHT, HIGH); % EW crosswalk white
        else % set LOW
            digiWrite(ljHl, CEW_WHT, LOW);  % EW crosswalk white 
            digiWrite(ljHlm CEW_RED, HIGH); % EW crosswalk red
        end;end;
    end;end;
end
