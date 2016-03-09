% - prints a given error message if an errno value is present
%{
    James Ross
    Abdikadir Musa
    Jacob Metoxen

    filename: errMsg.m
%}

function errMsg(err, message, pinNum, state)
    if(err > NOERR)
        fprintf(stderr, message 'pinNum: %d state: %d', pinNum, state);
        Error_Message(err);
    end
end
