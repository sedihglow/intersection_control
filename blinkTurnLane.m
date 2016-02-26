% - blink the directions turn lane for the green light time.
%{
    James Ross
    name 2
    name 3

    filename: blinkTurnLane.m
%}

function blinkTurnLane(jlHl, streetDirection, timeToBlink)
    HIGH      = 1;
    LOW       = 0;
    NS        = 0; % represents NS crosswalk
    EW        = 1; % represents EW crosswalk
    currTime  = 0; % current time paused
    pauseTime = 0; % time between blinks
    state     = 0; % state of the button. High after 1 button press

    while(currTime < waitTime)
        if(direction  == NS)
            if(state == LOW)
                digiWrite(ljHl,  6, HIGH); % NS turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl,  6, LOW);  % NS turn lane green
                state = LOW;
            end;end;
        else % direction is EW
            if(state == LOW)
                digiWrite(ljHl,  6, HIGH); % NS turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl,  6, LOW);  % NS turn lane green
                state = LOW;
            end;end;
        end;end; % end direction if-else
        pause(pauseTime);
        currTime = currTime + pauseTime;
    end % end while
end
