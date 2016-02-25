% - execute functionality for street north/sound (0), crosswalk east/west (1)
%{
    James Ross
    name 2
    name 3

    filename: changeDirection.m
%}

% streetDirection, 0 for NS street, EW crosswalk
%                  1 for EW street, NS crosswalk
function changeDirection(streetDirection)
    HIGH = 1;
    LOW  = 0;
    NS   = 0;          % represents NS street EW crosswalk
    EW   = 1;          % represents EW street NS crosswalk 
    % light timers
    turnGreen     = 0; % length for a turn lane green light
    timeYellow    = 0; % length for a yellow light
    forwardGreen  = 0; % length for a forward green light


    if(streetDirection != NS && streetDirection != EW)
        error('changeDirection: invalid input. 0 == street NS, 1 == street EW');
    end
    if(streetDirection == NS) % NS streed EW crosswalk
        % set turn lane to green for turnGreen time.
        digiWriteToPin(ljHl, 8, LOW);  % NS turn lane red
        digiWriteToPin(ljHl, 6, HIGH); % NS turn lane green
        wait(turnGreenLen);
        digiWriteToPin(ljHl, 6, LOW);  % NS turn lane green
        % set turn lane to yellow for turnYellow time.
        digiWriteToPin(ljHl, 7, HIGH); % NS turn lane yellow
        pause(timeYellow);
        digiWriteToPin(ljHl, 7, LOW);  % NS turn lane yellow

        % set turn lane red
        digiWriteToPin(ljHl, 8, HIGH); % NS turn lane red

        % set forward lane green from red
        digiWriteToPin(ljHl, 11, LOW); % NS forward lane red
        digiWriteToPin(ljHl, 9,  HIGH);% NS forward lane green

        % Change the cross walks
        crossLight(EW, HIGH);

        pause(1); % momentary pause keeping turn lane red
        % set turn lane blinking green 
        % TODO: the turn lane blink funcion, refer to the lab
        
        digiWriteToPin(ljHl, 9, LOW); % NS forward lane green
        % end all the bullshit with timeings, blinkings, and turing off green
       
        % set the turn lane and forward lane yellow
        digiWriteToPin(ljHl, 7,  HIGH); % NS turn lane    yellow
        digiWriteToPin(ljHl, 10, HIGH); % NS forward lane yellow
        pause(timeYellow);
        digiWriteToPin(ljHl, 7,  LOW);  % NS turn lane    yellow
        digiWriteToPin(ljHl, 10, LOW);  % NS forward lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWriteToPin(ljHl, 8,  HIGH); % NS turn lane    red
        digiWriteToPin(ljHl, 11, HIGH); % NS forward lane red
        crossLight(EW, LOW);
    else % EW street NW crosswalk
        % set turn lane to green for turnGreen time.
        digiWriteToPin(ljHl, 14, LOW);  % EW turn lane red
        digiWriteToPin(ljHl, 12, HIGH); % EW turn lane green
        wait(turnGreenLen);
        digiWriteToPin(ljHl, 12, LOW);  % EW turn lane green

        % set turn lane to yellow for turnYellow time.
        digiWriteToPin(ljHl, 13, HIGH); % EW turn lane yellow
        pause(timeYellow);
        digiWriteToPin(ljHl, 13, LOW);  % EW turn lane yellow

        % set turn lane red
        digiWriteToPin(ljHl, 14, HIGH); % EW turn lane red

        % set forward lane green from red
        digiWriteToPin(ljHl, 17, LOW);  % EW forward lane red
        digiWriteToPin(ljHl, 15, HIGH); % EW forward lane green

        % Change the cross walks
        crossLight(NS, HIGH);

        pause(1); % momentary pause keeping turn lane red
        % set turn lane blinking green 
        % TODO: the turn lane blink funcion, refer to the lab


        % end all the bullshit with timeings, blinkings, and turing off green

        % set the turn lane and forward lane yellow
        digiWriteToPin(ljHl, 13, HIGH); % EW turn lane    yellow
        digiWriteToPin(ljHl, 16, HIGH); % EW forward lane yellow
        pause(timeYellow);
        digiWriteToPin(ljHl, 16, LOW);  % EW forward lane yellow
        digiWriteToPin(ljHl, 13, LOW);  % EW turn lane    yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWriteToPin(ljHl, 14, HIGH); % EW turn lane    red
        digiWriteToPin(ljHl, 17, HIGH); % EW forward lane red
        crossLight(NS, LOW);
    end;end;
end
