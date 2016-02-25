% - Controls the LED's on a 4 way intersection for ece102 project
%{
    James Ross
    name 2
    name 3

    filename: intersection.m
%}

ljud_LoadDriver;    % LabJack drivers
ljud_Constants;     % LabJack constants

[errno, ljHl] = ljud_OpenLabJack(LJ_dtU3, LJ_ctUSB. '1', 1_); % locate LabJack
if(errno > 0)
    % TODO: Make it print what the errno value is if there is a failure.
    error('Failed to open connection to labjack');
end

errno = ljud_ePut(ljHl, LJ_ioPIN_CONFIGURATION_RESET, 0, 0, 0); % default settings
if(errno > 0)
    % TODO: Make it print what the errno value is if there is a failure.
    error('Failure to set default LabJack settings');
end

initialize(); % initialize the intersection for first time use.
   
northSouthST = 0;   % identifies north

while(1)            % loop untill no more power is provided to the device.
    changeDirection(northSouthST);   % crosswalk EW will change accordingly.
    changeDirection(eastWestST);   % crosswalk NS will change accordingly.
end


