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
    timeTurnGreen = 0; % length for a turn lane green light
    timeYellow    = 0; % length for a yellow light
    timeFwdGreen  = 0; % length for a forward green light

    if(streetDirection != NS && streetDirection != EW)
        error('changeDirection: invalid input. 0 == street NS, 1 == street EW');
    end
    if(streetDirection == NS) % NS streed EW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, 8, LOW);  % NS turn lane red
        digiWrite(ljHl, 6, HIGH); % NS turn lane green
        wait(timeTurnGreen);
        digiWrite(ljHl, 6, LOW);  % NS turn lane green
        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, 7, HIGH); % NS turn lane yellow
        pause(timeYellow);
        digiWrite(ljHl, 7, LOW);  % NS turn lane yellow

        % set turn lane red
        digiWrite(ljHl, 8, HIGH); % NS turn lane red

        % set forward lane green from red
        digiWrite(ljHl, 11, LOW); % NS forward lane red
        digiWrite(ljHl, 9,  HIGH);% NS forward lane green

        % Change the cross walks
        crossLight(ljHl, EW, HIGH);

        pause(1); % momentary pause keeping turn lane red

        % set turn lane blinking green
        blinkTurnLane(ljHl, NS, timeFwdGreen);
        
        % turn off green lights to change from go on street.
        digiWrite(ljHl, 6, LOW); % NS turn lane    green
        digiWrite(ljHl, 9, LOW); % NS forward lane green
       
        % set the turn lane and forward lane yellow
        digiWrite(ljHl, 7,  HIGH); % NS turn lane    yellow
        digiWrite(ljHl, 10, HIGH); % NS forward lane yellow
        pause(timeYellow);
        digiWrite(ljHl, 7,  LOW);  % NS turn lane    yellow
        digiWrite(ljHl, 10, LOW);  % NS forward lane yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, 8,  HIGH); % NS turn lane    red
        digiWrite(ljHl, 11, HIGH); % NS forward lane red
        crossLight(ljHl, EW, LOW);
    else % EW street NW crosswalk
        % set turn lane to green for turnGreen time.
        digiWrite(ljHl, 14, LOW);  % EW turn lane red
        digiWrite(ljHl, 12, HIGH); % EW turn lane green
        wait(TimeTurnGreen);
        digiWrite(ljHl, 12, LOW);  % EW turn lane green

        % set turn lane to yellow for turnYellow time.
        digiWrite(ljHl, 13, HIGH); % EW turn lane yellow
        pause(timeYellow);
        digiWrite(ljHl, 13, LOW);  % EW turn lane yellow

        % set turn lane red
        digiWrite(ljHl, 14, HIGH); % EW turn lane red

        % set forward lane green from red
        digiWrite(ljHl, 17, LOW);  % EW forward lane red
        digiWrite(ljHl, 15, HIGH); % EW forward lane green

        % Change the cross walks
        crossLight(ljHl, NS, HIGH);

        pause(1); % momentary pause keeping turn lane red

        % set turn lane blinking green 
        blinkTurnLane(ljHl, EW, timeFwdGreen);

        % turn off green lights to change from go on street.
        digiWrite(ljHl, 12, LOW); % EW turn lane    green
        digiWrite(ljHl, 15, LOW); % EW forward lane green

        % set the turn lane and forward lane yellow
        digiWrite(ljHl, 13, HIGH); % EW turn lane    yellow
        digiWrite(ljHl, 16, HIGH); % EW forward lane yellow
        pause(timeYellow);
        digiWrite(ljHl, 16, LOW);  % EW forward lane yellow
        digiWrite(ljHl, 13, LOW);  % EW turn lane    yellow

        % set the turn lane, forward lane and crosswalk to red
        digiWrite(ljHl, 14, HIGH); % EW turn lane    red
        digiWrite(ljHl, 17, HIGH); % EW forward lane red
        crossLight(ljHl, NS, LOW);
    end;end;
end
