callfunction(X, ArgNum):-
    call(X), % Unificatioon happens
    arg(ArgNum,X,V), % Gets the (ArgNum)th argument. 
    writeln(V).
    %tell('filename.txt'),writeln(V),told . % Write to finename.txt 
