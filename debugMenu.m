% - Debug options for a 4 way intersection
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: debugMenu.m
%}

function debugChoice = debugMenu();
    clc
    fprintf('Input corresponding number for desired debug test\n'
            '1: NS crosswalk buttons (no light interactions)\n'
            '2: EW crosswalk buttons (no light interactions)\n'
            '3: NS intersection functionality (no crosswalk interaction)\n'
            '4: EW intersection functionality (no crosswalk interaction)\n'
            '5: NS intersection functionality (crosswalk interaction)\n'
            '6: EW intersection functionality (crosswalk interaction)\n'
            '7: Full operation, equivelant to standard operation\n'
            '8: Exit debug\n');
    % TODO: Check behavior when nothing is entered and str2num returns []
    % TODO: Check behavior when using a string instead of numbers in while
    while(debugChoice < '1' && debugChoice > '8')
        debugChoice = input('choice: ');
    end
    debugChoice = str2num(debugChoice);
end
