% - Functionality menu for 4 way intersection
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: menuOptions.m
%}

function mode = menuOptions()
    clc
    fprintf('Input corresponding number for desired operation.\n'
            '1 : standard operation\n'
            '2 : double speed operation.\n'
            '3 : debug menu.\n'
            '4 : exit program\n');
    % TODO: Check behavior when nothing is entered and str2num returns []
    % TODO: Check behavior when using a string instead of numbers in while
    while(debugChoice < '1' && debugChoice > '3')
        mode = input('choice: ');
    end
    mode = str2num(mode);
end
