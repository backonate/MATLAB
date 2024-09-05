%Q1
function [sout] = lab4(sin)

%Q1.1 (delete non english letters)
sin (isletter(sin)==0) = '';

%Q1.2 (Converts even-indexed letters in the remaining string to upper-case
%letters)
    for k=2:2:length(sin);

            sin(k)=upper(sin(k));

    end

    %Q1.3 (Return the new string)
    sout = sin;
end
