% - execute functionality for street north/sound (0), crosswalk east/west (1)
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: changeDirection.m
%}

% streetDirection, 0 for NS street, EW crosswalk
%                  1 for EW street, NS crosswalk
function changeDirection(ljHl, streetDirection, mode)
    global TNS_GRN;      % NS turn lane green
    global TNS_YLW;      % NS turn lane yellow
    global TNS_RED;      % NS turn lane red
    global FNS_GRN;      % NS forward lane green
    global FNS_YLW;      % NS forward lane yellow
    global FNS_RED;      % NS forward lane red
    global TEW_GRN;      % EW turn lane green
    global TEW_YLW;      % EW turn lane yellow
    global TEW_RED;      % EW turn lane red
    global FEW_GRN;      % EW forward lane green
    global FEW_YLW;      % EW forward lane yellow
    global FEW_RED;      % EW forward lane red
    global HIGH;     % HIGH voltage
    global LOW;      % LOW voltage
    global NS;       % north/south direction
    global EW;       % east/west direction
    global STDOP;    % standard operation
    global DEBUG;    % initiate debug
    global DBL;      % go double speed 

    % light timers
    timeTurnGreen = 7; % length for a turn lane green light
    timeYellow    = 3.6; % length for a yellow light
    timeFwdGreen  = 12; % length for a forward green light
    
    % times cut in half. (double speed)
    halfTurnGreen  = timeTurnGreen/2;
    halfYellow     = timeYellow/2;
    halfFwdGreen   = timeFwdGreen/2;
    
    crossState = LOW; % current state of crosswalk button

    if(streetDirection ~= NS && streetDirection ~= EW)
        error('changeDirection: invalid input. 0 == street NS, 1 == street EW');
    end
    if(streetDirection == NS) % NS streed EW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, TNS_RED, LOW);  % NS turn lane red
        digiWrite(ljHl, TNS_GRN, HIGH); % NS turn lane green
        if(mode == DBL)
            light_wait(ljHl, NS, halfTurnGreen);
        else if(mode == DEBUG)
                light_wait(ljHl, NS, timeTurnGreen);
            else
                light_wait(ljHl, NS, timeTurnGreen);
            end
        end
        crossState = LOW;
        digiWrite(ljHl, TNS_GRN, LOW);  % NS turn lane green
        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, TNS_YLW, HIGH); % NS turn lane yellow
        if(mode == DBL)
            pause(halfYellow);
        else
            pause(timeYellow);
        end 
        digiWrite(ljHl, TNS_YLW, LOW);  % NS turn lane yellow

        % set turn lane red
        digiWrite(ljHl, TNS_RED, HIGH); % NS turn lane red

        % set forward lane green from red
        digiWrite(ljHl, FNS_RED, LOW);  % NS forward lane red
        digiWrite(ljHl, FNS_GRN, HIGH); % NS forward lane green

        % Change the cross walks
        crossLights(ljHl, EW, HIGH);

        pause(1); % keep turn lane red for pedestrians to start crossing

        % set turn lane blinking green
        digiWrite(ljHl, TNS_RED, LOW); % EW turn lane red
        if(mode == DBL)
            blinkTurnLane(ljHl, NS, halfFwdGreen, crossState);
        else
            blinkTurnLane(ljHl, NS, timeFwdGreen, crossState);
        end 
        crossState = LOW;
        
        % turn off green lights to change from go on street.
        digiWrite(ljHl, TNS_GRN, LOW);  % NS turn lane green
        digiWrite(ljHl, FNS_GRN, LOW);  % NS forward lane green
       
        % set the turn lane and forward lane yellow
        digiWrite(ljHl, TNS_YLW, HIGH); % NS turn lane yellow
        digiWrite(ljHl, FNS_YLW, HIGH); % NS forward lane yellow
        if(mode == DBL)
            pause(halfYellow);
        else
            pause(timeYellow);
        end
        digiWrite(ljHl, TNS_YLW, LOW);  % NS turn lane yellow
        digiWrite(ljHl, FNS_YLW, LOW);  % NS forward lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, TNS_RED, HIGH); % NS turn lane red
        digiWrite(ljHl, FNS_RED, HIGH); % NS forward lane red
        crossLights(ljHl, EW, LOW);
    else % EW street NW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, TEW_RED, LOW);  % EW turn lane red
        digiWrite(ljHl, TEW_GRN, HIGH); % EW turn lane green
        if(mode == DBL)
            crossState = light_wait(ljHl, EW, halfTurnGreen);
        else if(mode == DEBUG)
                crossState = light_wait(ljHl, EW, timeTurnGreen);
            else
                crossState = light_wait(ljHl, EW, timeTurnGreen);
            end
        end
        digiWrite(ljHl, TEW_GRN, LOW);  % EW turn lane green

        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, TEW_YLW, HIGH); % EW turn lane yellow
        if(mode == DBL)
            pause(halfYellow);
        else
            pause(timeYellow);
        end
        digiWrite(ljHl, TEW_YLW, LOW);  % EW turn lane yellow

        % set turn lane red
        digiWrite(ljHl, TEW_RED, HIGH); % EW turn lane red

        % set forward lane green from red
        digiWrite(ljHl, FEW_RED, LOW);  % EW forward lane red
        digiWrite(ljHl, FEW_GRN, HIGH); % EW forward lane green

        % Change the cross walks
        crossLights(ljHl, NS, HIGH);

        pause(1); % keep turn lane red for pedestrians to start crossing

        % set turn lane blinking green 
        digiWrite(ljHl, TEW_RED, LOW); % EW turn lane red
        if(mode == DBL)
            blinkTurnLane(ljHl, EW, halfFwdGreen, crossState);
        else
            blinkTurnLane(ljHl, EW, timeFwdGreen, crossState);
        end 
        crossState = LOW;
        
        % turn off green lights to change from go on street.
        digiWrite(ljHl, TEW_GRN, LOW); % EW turn lane green
        digiWrite(ljHl, FEW_GRN, LOW); % EW forward lane green

        % set the turn lane and forward lane yellow
        digiWrite(ljHl, TEW_YLW, HIGH); % EW turn lane yellow
        digiWrite(ljHl, FEW_YLW, HIGH); % EW forward lane yellow
        if(mode == DBL)
            pause(halfYellow);
        else
            pause(timeYellow);
        end
        digiWrite(ljHl, FEW_YLW, LOW);  % EW forward lane yellow
        digiWrite(ljHl, TEW_YLW, LOW);  % EW turn lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, TEW_RED, HIGH); % EW turn lane red
        digiWrite(ljHl, FEW_RED, HIGH); % EW forward lane red
        crossLights(ljHl, NS, LOW);
    end
end
