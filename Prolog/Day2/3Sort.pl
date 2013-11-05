i_sort([],Acc,Acc).
i_sort([Head|Tail],Acc,Sorted):- insert(Head,Acc,NAcc), i_sort(Tail,NAcc,Sorted).

insert(Head,[Head2|Tail],[Head2|Tail2]):- Head>Head2,insert(Head,Tail,Tail2).
insert(Head,[Head2|Tail],[Head,Head2|Tail]):- Head=<Head2.
insert(Head,[],[Head]).