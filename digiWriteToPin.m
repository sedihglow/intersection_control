% - Sets a given LabJack pin red.
%{
    James Ross
    name 2
    name 3

    filename: digiWriteToPin.m
%}

function writePinRed(ljHl, pinNum, state)
    errno = ljud_ePut(ljHl, LJ_ioPUT_DIGITAL_BIT, pinNum, state,0);
    pause(0.2);
    % TODO: Make the pin number and the state show in message dynamically.
    errMsg(errno, 'Initialize: failure to write pin'); 
end
