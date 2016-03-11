% - Controls the LED's on a 4 way intersection for ece102 project
%{
    James Ross
    Adbikadir Musa
    Jacob Metoxen

    filename: intersection.m
%}

clc
clear

% TODO: Does matlab have a #define equivalent? Preventing globals. 
%       Want my C back D: Assembly! Something!
% pin declarations
global CNS_RED;      % NS crosswalk red
       CNS_RED = 0; 
global CNS_WHT;      % NS crosswalk white
       CNS_WHT = 1; 
global CEW_RED;      % EW crosswalk red
       CEW_RED = 2;
global CEW_WHT;      % EW corsswalk white
       CEW_WHT = 3;  
global CNS_BUT;      % NS crosswalk button
       CNS_BUT = 4;
global CEW_BUT;      % EW crosswalk button
       CEW_BUT = 5;
global TNS_GRN;      % NS turn lane green
       TNS_GRN = 6;
global TNS_YLW;      % NS turn lane yellow
       TNS_YLW = 7;
global TNS_RED;      % NS turn lane red
       TNS_RED = 8;
global FNS_GRN;      % NS forward lane green
       FNS_GRN = 9;
global FNS_YLW;      % NS forward lane yellow
       FNS_YLW = 10;
global FNS_RED;      % NS forward lane red
       FNS_RED = 11;
global TEW_GRN;      % EW turn lane green
       TEW_GRN = 12;
global TEW_YLW;      % EW turn lane yellow
       TEW_YLW = 13;
global TEW_RED;      % EW turn lane red
       TEW_RED = 14;
global FEW_GRN;      % EW forward lane green
       FEW_GRN = 15;
global FEW_YLW;      % EW forward lane yellow
       FEW_YLW = 16;
global FEW_RED;      % EW forward lane red
       FEW_RED = 17;

% general variables for functionality
global HIGH;     % HIGH voltage
       HIGH  = 1;
global LOW;      % LOW voltage
       LOW   = 0;
global NS;       % north/south direction
       NS    = 0;
global EW;       % east/west direction
       EW    = 1;
global NOERR;    % no error in errno
       NOERR = 0;
global STDOP;    % standard operation
       STDOP = 1;
global DEBUG;    % initiate debug
       DEBUG = 3;
global DBL;      % go double speed 
       DBL   = 2;
global GREEN;    % Sets a signal for green from red.
       GREEN = 1;
global RED;      % Sets a signal for red to green.
       RED   = 0;
global NOCROSS; % run with no crosswalk
       NOCROSS  = 0; 
global WITHCROSS; % run with a crosswalk
       WITHCROSS = 1; 

ljud_LoadDriver; % LabJack drivers
ljud_Constants;  % LabJack constants

% last 2 values passed in ljud_OpenLabJack '1', 1, dault values.
[errno, ljHl] = ljud_OpenLabJack(LJ_dtU3, LJ_ctUSB, '1', 1); % locate LabJack
if(errno > NOERR)
    fprintf(2,'Failed to open connection to labjack: error#: %d\n', errno);
    Error_Message(errno);
    error('terminating program'); % cleanly exit the program
end

% last 3 numbers passed in ljud_ePut is 0,0,0, default values.
errno = ljud_ePut(ljHl, LJ_ioPIN_CONFIGURATION_RESET, 0, 0, 0); % default settings
if(errno > NOERR)
    fprintf(2,'Failure to set default LabJack settings: error#: %d\n', errno);
    Error_Message(errno);
    error('terminating program'); % cleanly exit the program
end

mode = 0; % what mode to operate the intersection in.
initialize(ljHl);  
while(mode == DEBUG || (mode == 0)) % present menu even after closing DEBUG
    mode = menuOptions();
    if(mode == DEBUG)
        toDb = 0;
        while(toDb < 8)
            initialize(ljHl); % ensure fresh start for debug
            toDb = debugMenu(ljHl);
        end % while
    end % end if
    initialize(ljHl); % initialize the intersection for first time use.
end % end while

if(mode == STDOP || mode == DBL)
    normalOperation(ljHl, mode);
end