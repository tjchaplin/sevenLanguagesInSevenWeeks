rev([],List,List).
rev([Head|Tail],List,Result) :- rev(Tail,[Head|List],Result).