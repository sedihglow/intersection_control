% - Functionality menu for 4 way intersection
%{
    James Ross
    name 2
    name 3

    filename: menuOptions.m
%}

function mode = menuOptions()
    fprintf('\nInput corresponding number for desired operation.\n');
    fprintf('1 : standard operation\n'
            '2 : double speed operation.\n'
            '3 : debug menu.\n');
    mode = input('choice: ');
end
