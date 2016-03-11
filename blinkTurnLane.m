% - blink the directions turn lane for the green light time.
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: blinkTurnLane.m
%}

function blinkTurnLane(ljHl, direction, timeToBlink, crossState)
    global TNS_GRN;
    global TEW_GRN;
    global CNS_BUT;
    global CEW_BUT;
    global NS;
    global HIGH;
    global LOW;
    
    buttonCheck = HIGH; % buttons are active LOW
    state = LOW;
    prevPressed = false; % flag showing if crosswalk was handled or not.
    currTime  = 0; % current time paused
    crossDiv  = 2; % time to divide the wait time to determin crossPriority
    crossPriority = timeToBlink/crossDiv; % time cut from waitTime for cross walk
    
    tic
    while(currTime < timeToBlink)
        if(direction  == NS)
            if(state == LOW)
                digiWrite(ljHl,TNS_GRN, HIGH); % NS turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl, TNS_GRN, LOW); % NS turn lane green
                state = LOW;
            end
            if(buttonCheck == HIGH)
                buttonCheck = digiRead(ljHl, CEW_BUT); % NS crosswalk buttons
            end
        else % direction is EW
            if(state == LOW)
                digiWrite(ljHl, TEW_GRN, HIGH); % EW turn lane green
                state = HIGH;
            else % state == HIGH
                digiWrite(ljHl, TEW_GRN, LOW); % EW turn lane green
                state = LOW;
            end
            if(buttonCheck == HIGH)
                buttonCheck = digiRead(ljHl, CNS_BUT); % EW crosswalk buttons
            end
        end % end direction if-else
        if(buttonCheck == LOW && prevPressed == false)
            currTime = toc;
        else
            currTime = toc + crossPriority;
            prevPressed = true;
        end
    end % end while
end
