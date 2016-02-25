% - prints a given error message if an errno value is present
%{
    James Ross
    name 2
    name 3

    filename: errMsg.m
%}

function errMsg(err, message)
    if(err > 0)
        error(message);
    end
end
