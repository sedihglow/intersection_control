% - Code for the debug menu to test each individual street NS/EW
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: debugStreet.m
%}

function debugStreet(ljHl, cross, direction)
    global NS;
    global NOCROSS;
    global DEBUG;
    global STDOP;
    
    if(direction == NS)
        if(cross == NOCROSS)
            changeDirection(ljHl, NS, DEBUG); % disables crosswalks
        else
            changeDirection(ljHl, NS, STDOP); % standard w/ crosswalks
        end
    else
        if(cross == NOCROSS)
            changeDirection(ljHl, NS, DEBUG); % disables crosswalks
        else
            changeDirection(ljHl, NS, STDOP); % standard w/ crosswalks
        end
    end
end
