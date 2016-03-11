% - Functionality menu for 4 way intersection
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: menuOptions.m
%}

function mode = menuOptions()
    clc
    mode = 0;
    fprintf('Input corresponding number for desired operation.\n')
    fprintf('1 : Standard operation.\n');
    fprintf('2 : Double speed operation.\n');
    fprintf('3 : Debug menu.\n');
    fprintf('4 : Exit program.\n');
    mode = 0;
    while((mode < 1 || mode > 4) || isnan(mode) == 1)
        mode = input('choice: ', 's');
        mode = str2double(mode);
    end
end
