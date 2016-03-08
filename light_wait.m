% - checks crosswalk and handles wait times for lights
%{
    James Ross
    name 2
    name 3

    filename: light_wait.m
%}

function light_wait(ljHl, direction, waitTime)
    state     = 0;  % state of the button. High after 1 button press
    currTime  = 0;  % current time that has occured due to pause functions.
    pauseTime = 0.1;% time paused before checking crosswalk.
    crossDiv  = 4;  % time to divide the wait time to determin crossPriority

    crossPriority = waitTime/crossDiv; % time cut from waitTime for cross walk

    while(currTime < waitTime)
        if(state == LOW) % button was never pressed 
            if(direction  == NS)
               state = digiRead(ljHl, CNS_BUT) % NS crosswalk buttons
            else
               state = digiRead(ljHl, CEW_BUT) % EW crosswalk buttons
            end;end;

            if(state == HIGH) % button was pressed
                currTime = currTime + crossPriority;
                prevPressed = true;
            end
        end

        pause(pauseTime);
        currTime = currTime + pauseTime;
    end % end while
end 
