rev([], []).
rev([Head|[Head2|[]]],[Head2,Head]).
rev([Head|[Head2|[Head3|[]]]],[Head3,Head2,Head]).