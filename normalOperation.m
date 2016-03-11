% - Normal operation for a 4 way intersection
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: normalOperation.m
%}

function normalOperation(ljHl, mode)
    global DEBUG;
    global NS;
    global EW;
    
    if(mode == DEBUG) % Single interation through intersection for DEBUG
            changeDirection(ljHl, NS, mode); % crosswalk EW will change accordingly.
            changeDirection(ljHl, EW, mode); % crosswalk NS will change accordingly.
    else % STDOP
        while(true)    % loop untill no more power is provided to the device.
            changeDirection(ljHl, NS, mode); % crosswalk EW will change accordingly.
            changeDirection(ljHl, EW, mode); % crosswalk NS will change accordingly.
        end
    end
end
