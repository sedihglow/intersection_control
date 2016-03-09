% - checks crosswalk and handles wait times for lights
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: light_wait.m
%}

function light_wait(ljHl, direction, waitTime, mode)
    state     = 0;   % state of the button. High after 1 button press
    currTime  = 0;   % current time that has occured due to pause functions.
    pauseTime = 0.1; % time paused before checking crosswalk.
    crossDiv  = 4;   % time to divide the wait time to determin crossPriority

    crossPriority = waitTime/crossDiv; % time cut from waitTime for cross walk
    
    tick
    while(currTime < waitTime)
        if(state == LOW) % button was never pressed 
            if(direction == NS)
               state = digiRead(ljHl, CNS_BUT) % NS crosswalk buttons
            else
               state = digiRead(ljHl, CEW_BUT) % EW crosswalk buttons
            end

            if(state == HIGH ) % button was pressed
                currTime = currTime + crossPriority;
            end
        end
        currTime = toc;
    end % end while
end 
