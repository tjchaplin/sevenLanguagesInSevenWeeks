val l = List("a","a","ab")
println(l.foldLeft(0)((sum,item) => sum+item.length))