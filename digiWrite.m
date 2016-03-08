% - Sets a given LabJack pin.
%{
    James Ross
    name 2
    name 3

    filename: digiWrite.m
%}

function digiWrite(ljHl, pinNum, state)
    % last number passed in ljud_ePut is 0, default value.
    errno = ljud_ePut(ljHl, LJ_ioPUT_DIGITAL_BIT, pinNum, state,0);
    pause(0.2);
    errMsg(errno, 'digiWrite: failure to write pin', pinNum, state); 
end
