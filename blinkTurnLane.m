% - blink the directions turn lane for the green light time.
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: blinkTurnLane.m
%}

function blinkTurnLane(jlHl, streetDirection, timeToBlink)
    currTime  = 0; % current time paused
    pauseTime = 0; % time between blinks
    state     = 0; % state of the button. High after 1 button press

    while(currTime < waitTime)
        if(direction  == NS)
            if(state == LOW)
                digiWrite(ljHl,TNS_GRN, HIGH); % NS turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl, TNS_GRN, LOW); % NS turn lane green
                state = LOW;
            end;
        else % direction is EW
            if(state == LOW)
                digiWrite(ljHl, TEW_GRN, HIGH); % EW turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl, TEW_GRN, LOW); % EW turn lane green
                state = LOW;
            end
        end % end direction if-else
        pause(pauseTime);
        currTime = currTime + pauseTime;
    end % end while
end
