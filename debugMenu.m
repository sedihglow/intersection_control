% - Debug options for a 4 way intersection
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: debugMenu.m
%}

function debugChoice = debugMenu(ljHl)
    clc
    global NS;
    global EW;
    global NOCROSS;
    global WITHCROSS;
    global DEBUG;
    
    fprintf('Input corresponding number for desired debug test\n');
    fprintf('1: NS crosswalk buttons (no light interactions)\n');
    fprintf('2: EW crosswalk buttons (no light interactions)\n');
    fprintf('3: NS intersection functionality (no crosswalk interaction)\n');
    fprintf('4: EW intersection functionality (no crosswalk interaction)\n');
    fprintf('5: NS intersection functionality (crosswalk interaction)\n');
    fprintf('6: EW intersection functionality (crosswalk interaction)\n');
    fprintf('7: Full operation, equivelant to standard operation\n');
    fprintf('8: Exit debug\n');

    debugChoice = 0;
    while((debugChoice < 1 || debugChoice > 8) || isnan(debugChoice) == 1)
            debugChoice = input('choice: ', 's');
            debugChoice = str2double(debugChoice);
    end
    
    switch(debugChoice)
        case 1
            debugCrosswalk(ljHl, NS);
        case 2
            debugCrosswalk(ljHl, EW);
        case 3
            debugStreet(ljHl, NOCROSS, NS);
        case 4
            debugStreet(ljHl, NOCROSS, EW);
        case 5
            debugStreet(ljHl, WITHCROSS, NS);
        case 6
            debugStreet(ljHl, WITHCROSS, EW);
        case 7
            normalOperation(ljHl, DEBUG);
        case 8
            return;
        otherwise
            error('Invalid return from debugMenu() in intersection()');
     end % end switch
end
