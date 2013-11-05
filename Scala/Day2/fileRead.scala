val filename = "censor.csv"
for (line <- scala.io.Source.fromFile(filename).getLines()) {
  println(line)
}