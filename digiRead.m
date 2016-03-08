% - Reads a given LabJack pin.
%{
    James Ross
    name 2
    name 3

    filename: digiRead.m
%}

function state = digiRead(ljHl, pinNum)
    % last 2 numbers passed in ljud_eGet is 0,0. Default values.
    [errno, state] = ljud_eGet (ljHandle, LJ_ioGET_DIGITAL_BIT, pinNum, 0, 0);
    pause(0.2);
    errMsg(errno, 'digiRead: failure to read state from pin', pinNum, state); 
end
