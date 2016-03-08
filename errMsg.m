% - prints a given error message if an errno value is present
%{
    James Ross
    name 2
    name 3

    filename: errMsg.m
%}

function errMsg(err, message, pinNum, state)
    if(err > NOERR)
        fprintf(stderr, message 'pinNum: %d state: %d', pinNum, state);
        Error_Message(err);
    end
end
