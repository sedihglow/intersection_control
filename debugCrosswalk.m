% - debug NS crosswalk
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: debugCrosswalk.m
%}

function debugCrosswalk(ljHl, direction)
    global TNS_RED;
    global FNS_RED;
    global TNS_GRN;
    global FNS_GRN;
    global TEW_RED;
    global FEW_RED;
    global TEW_GRN;
    global FEW_GRN;
    global HIGH;
    global LOW;
    global NS;
    global EW;
    global GREEN;
    global RED;
    
    debugWait = 10; % time for light and button checks
    % test crosswalk light functionality
    crossLights(ljHl, direction, GREEN);
    pause(1);
    crossLights(ljHl, direction, RED);
    
    fprintf('\nWatches for button press while light is on, effects timer.\n');
    if(direction == NS) % turn on green lights for corresponding crosswalk.
        % turn off red lights
        digiWrite(ljHl, TNS_RED, LOW);
        digiWrite(ljHl, FNS_RED, LOW);
        % enable green lights
        digiWrite(ljHl, TNS_GRN, HIGH);
        digiWrite(ljHl, FNS_GRN, HIGH);

        % Use blink function to test cross walk button functionality.
        tic;
        blinkTurnLane(ljHl, NS, debugWait, LOW);
    else
        % turn off red lights
        digiWrite(ljHl, TEW_RED, LOW);
        digiWrite(ljHl, FEW_RED, LOW);
        % enable green lights
        digiWrite(ljHl, TEW_GRN, HIGH);
        digiWrite(ljHl, FEW_GRN, HIGH);
        
        % Use blink function to test cross walk button functionality.
        tic;
        blinkTurnLane(ljHl, EW, debugWait, LOW);
    end

    fprintf('Time for light to change was %.4f, ', toc);
    fprintf('%d set before button\n', debugWait);
    pause(debugWait);
end
