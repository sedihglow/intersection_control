% - checks crosswalk and handles wait times for lights
%{
    James Ross
    name 2
    name 3

    filename: light_wait.m
%}



function light_wait(waitTime)
    currTime      = 0; % current time that has occured due to pause functions.
    pauseTime     = 0; % time paused before checking crosswalk.
    prevPressed   = 0; % changes to a 1 if the crosswalk button has registered
    crossDiv      = 4; % time to divide the wait time to determin crossPriority
    crossPriority = waitTime/crossDiv; % time cut from waitTime for cross walk

    while(currTime < waitTime)
        % TODO: check the crosswalk
        if( %{ button was pressed && %} prevPressed == 0)
            currTime = currTime + crossPriority;
            prevPressed = 1;
        end
        pause(pauseTime);
        currTime = currTime + pauseTime;
    end 
end
