% - changes the states of the given street directions lights
%{
    James Ross
    name 2
    name 3

    filename: crossLights.m
%}

% state defines wether to send the crosswalk lights HIGH or LOW
function crossLights(ljHl, streetDirection, state)
    HIGH = 1;
    LOW  = 0;
    NS   = 0;   % represents EW crosswalk
    EW   = 1;   % represents NS crosswalk 

    if(streetDirection == NS)
        if(state == HIGH)
            digiWrite(ljHl, 1, HIGH); % NS crosswalk white 
        else % set LOW
            digiWrite(ljHl, 1, LOW);  % NS crosswalk white 
        end;end;
    else % change EW
        if(state == HIGH)
            digiWrite(ljHl, 1, HIGH); % NS crosswalk white 
        else % set LOW
            digiWrite(ljHl, 1, LOW);  % NS crosswalk white 
        end;end;
    end;end;
end
