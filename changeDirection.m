% - execute functionality for street north/sound (0), crosswalk east/west (1)
%{
    James Ross
    name 2
    name 3

    filename: changeDirection.m
%}

% streetDirection, 0 for NS street, EW crosswalk
%                  1 for EW street, NS crosswalk
function changeDirection(streetDirection, mode)
    % light timers
    timeTurnGreen = 0; % length for a turn lane green light
    timeYellow    = 0; % length for a yellow light
    timeFwdGreen  = 0; % length for a forward green light
    
    % times cut in half. (double speed)
    halfTurnGreen  = timeTurnGreen/2;
    halfYellow = timeYellow/2;
    halfFwdGreen   = timeFwdGreen/2;

    if(streetDirection ~= NS && streetDirection ~= EW)
        error('changeDirection: invalid input. 0 == street NS, 1 == street EW');
    end
    if(streetDirection == NS) % NS streed EW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, TNS_RED, LOW);  % NS turn lane red
        digiWrite(ljHl, TNS_GRN, HIGH); % NS turn lane green
        if(mode == STDOP)
            wait(timeTurnGreen);
        else
            wait(halfTurnGreen);
        end; end;
        digiWrite(ljHl, TNS_GRN, LOW);  % NS turn lane green
        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, TNS_YLW, HIGH); % NS turn lane yellow
        if(mode == STDOP)
            pause(timeYellow);
        else 
            pause(halfYellow);
        end
        digiWrite(ljHl, TNS_YLW, LOW);  % NS turn lane yellow

        % set turn lane red
        digiWrite(ljHl, TNS_RED, HIGH); % NS turn lane red

        % set forward lane green from red
        digiWrite(ljHl, FNS_RED, LOW);  % NS forward lane red
        digiWrite(ljHl, FNS_GRN, HIGH); % NS forward lane green

        % Change the cross walks
        crossLight(ljHl, EW, HIGH);

        pause(1); % momentary pause keeping turn lane red

        % set turn lane blinking green
        blinkTurnLane(ljHl, NS, timeFwdGreen);
        
        % turn off green lights to change from go on street.
        digiWrite(ljHl, TNS_GRN, LOW);  % NS turn lane green
        digiWrite(ljHl, FNS_GRN, LOW);  % NS forward lane green
       
        % set the turn lane and forward lane yellow
        digiWrite(ljHl, TNS_YLW, HIGH); % NS turn lane yellow
        digiWrite(ljHl, FNS_YLW, HIGH); % NS forward lane yellow
        if(mode == STDOP)
            pause(timeYellow);
        else
            pause(halfYellow);
        end; end;
        digiWrite(ljHl, TNS_YLW, LOW);  % NS turn lane yellow
        digiWrite(ljHl, FNS_YLW, LOW);  % NS forward lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, TNS_RED, HIGH); % NS turn lane red
        digiWrite(ljHl, FNS_RED, HIGH); % NS forward lane red
        crossLight(ljHl, EW, LOW);
    else % EW street NW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, TEW_RED, LOW);  % EW turn lane red
        digiWrite(ljHl, TEW_GRN, HIGH); % EW turn lane green
        if(mode == STDOP)
            wait(TimeTurnGreen);
        else
            wait(halfTurnGreen);
        end; end;
        digiWrite(ljHl, TEW_GRN, LOW);  % EW turn lane green

        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, TEW_YLW, HIGH); % EW turn lane yellow
        if(mode == STDOP)
            pause(timeYellow);
        else
            pause(halfYellow);
        end; end;
        digiWrite(ljHl, TEW_YLW, LOW);  % EW turn lane yellow

        % set turn lane red
        digiWrite(ljHl, TEW_RED, HIGH); % EW turn lane red

        % set forward lane green from red
        digiWrite(ljHl, FEW_RED, LOW);  % EW forward lane red
        digiWrite(ljHl, FEW_GRN, HIGH); % EW forward lane green

        % Change the cross walks
        crossLight(ljHl, NS, HIGH);

        pause(1); % momentary pause keeping turn lane red

        % set turn lane blinking green 
        blinkTurnLane(ljHl, EW, timeFwdGreen);

        % turn off green lights to change from go on street.
        digiWrite(ljHl, TEW_GRN, LOW); % EW turn lane green
        digiWrite(ljHl, FEW_GRN, LOW); % EW forward lane green

        % set the turn lane and forward lane yellow
        digiWrite(ljHl, TEW_YLW, HIGH); % EW turn lane yellow
        digiWrite(ljHl, FEW_YLW, HIGH); % EW forward lane yellow
        if(mode == halfYellow)
            pause(timeYellow);
        else
            pause(halfYellow);
        end; end;
        digiWrite(ljHl, FEW_YLW, LOW);  % EW forward lane yellow
        digiWrite(ljHl, TEW_YLW, LOW);  % EW turn lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, TEW_RED, HIGH); % EW turn lane red
        digiWrite(ljHl, FEW_RED, HIGH); % EW forward lane red
        crossLight(ljHl, NS, LOW);
    end; end;
end
