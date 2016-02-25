% - checks crosswalk and handles wait times for lights
%{
    James Ross
    name 2
    name 3

    filename: light_wait.m
%}

function light_wait(ljHl, direction, waitTime)
    HIGH      = 1;
    LOW       = 0;
    NS        = 0;  % represents NS crosswalk
    EW        = 1;  % represents EW crosswalk
    state     = 0;  % state of the button. High after 1 button press
    currTime  = 0;  % current time that has occured due to pause functions.
    pauseTime = 0.1;% time paused before checking crosswalk.
    crossDiv  = 4;  % time to divide the wait time to determin crossPriority

    crossPriority = waitTime/crossDiv; % time cut from waitTime for cross walk

    while(currTime < waitTime)
        if(state == 0) % button was never pressed 
            if(direction  == NS)
               state = digiRead(ljHl, 4) % NS crosswalk buttons
            else
               state = digiRead(ljHl, 5) % EW crosswalk buttons
            end;end;

            if(state == 1) % button was pressed
                currTime = currTime + crossPriority;
                prevPressed = 1;
            end
        end

        pause(pauseTime);
        currTime = currTime + pauseTime;
    end % end while
end 
