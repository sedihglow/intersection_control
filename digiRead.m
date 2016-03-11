% - Reads a given LabJack pin.
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: digiRead.m
%}

function state = digiRead(ljHl, pinNum)
    ljud_Constants;  % LabJack constants
    % last 2 numbers passed in ljud_eGet is 0,0. Default values.
    [errno, state] = ljud_eGet (ljHl, LJ_ioGET_DIGITAL_BIT, pinNum, 0, 0);
    pause(.5);
    errMsg(errno, 'digiRead: failure to read state from pin', pinNum, state); 
end
