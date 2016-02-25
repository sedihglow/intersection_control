% - prints a given error message if an errno value is present
%{
    James Ross
    name 2
    name 3

    filename: errMsg.m
%}

function errMsg(err, message, pinNum, state)
    % TODO: have the pin number and state append to message
    if(err > 0)
        Error_Message(Error);
        error(message);
    end
end
