small([Head|[]],Head).
small([Head|[Head2|Tail]],Result) :- Head < Head2, small([Head|Tail],Result).
small([Head|[Head2|Tail]],Result) :- Head >= Head2, small([Head2|Tail],Result).