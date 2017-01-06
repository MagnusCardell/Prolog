% X contains legal function ex "append([a,s], s, X)" and ArgNum the function you want
% in this case, 3, to get the appended result.

callfunction(X, ArgNum):-
    call(X), % Unificatioon happens
    arg(ArgNum,X,V), % Gets the (ArgNum)th argument. 
    writeln(V).
    %tell('filename.txt'),writeln(V),told . % Write to finename.txt 
