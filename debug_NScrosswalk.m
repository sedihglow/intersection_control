% - debug NS crosswalk
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: debugCrosswalk.m
%}

function debugCrosswalk(ljHl, direction)
    debugWait = 5; % time for light and button checks
    % test crosswalk light functionality
    crossLights(ljHl, direction, GREEN);
    pause(1);
    crossLihts(ljHl, direction, RED);

    fprintf('\nWatches for button press while light is on, effects timer.\n');
    if(direction == NS) % turn on green lights for corresponding crosswalk.
        % turn off red lights
        digiWrite(ljHl, TNS_RED, LOW);
        ditiWrite(ljHl, FNS_RED, LOW);
        % enable green lights
        digiWrite(ljHl, TNS_GRN, HIGH);
        ditiWrite(ljHl, FNS_GRN, HIGH);
    else
        % turn off red lights
        digiWrite(ljHl, TEW_RED, LOW);
        ditiWrite(ljHl, FEW_RED, LOW);
        % enable green lights
        digiWrite(ljHl, TEW_GRN, HIGH);
        ditiWrite(ljHl, FEW_GRN, HIGH);
    end
    tic;
    light_wait(ljHl, direction, debugWait);
    fprintf('Time for light to change was %d\n',(toc));
end
