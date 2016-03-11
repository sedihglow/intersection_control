% - checks crosswalk and handles wait times for lights
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: light_wait.m
%}

function crossState = light_wait(ljHl, direction, waitTime)
    global CNS_BUT;
    global CEW_BUT;
    global NS;
    global LOW;
    
    currTime  = 0;   % current time that has occured due to pause functions.
    crossState = LOW;
    tic
    while(currTime < waitTime)
        if(crossState == LOW) % button was never pressed 
            if(direction == NS)
               crossState = digiRead(ljHl, CNS_BUT); % NS crosswalk buttons
            else
               crossState = digiRead(ljHl, CEW_BUT); % EW crosswalk buttons
            end
        end
        currTime = toc;
    end % end while
end 
