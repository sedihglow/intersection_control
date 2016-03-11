% - prints a given error message if an errno value is present
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: errMsg.m
%}

function errMsg(err, message, pinNum, state)
    global NOERR;
    if(err > NOERR)
        fprintf(2, message);
        fprintf('pinNum: %d state: %d\n', pinNum, state);
        Error_Message(err);
        error('Terminating program'); % cleanly exit
    end
end
