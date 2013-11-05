trait Censor{
	def filter(wordReplace:scala.collection.mutable.Map[String, String],value:String): String = {
		if(wordReplace.contains(value))
			return wordReplace(value)

		return value
	}
}
import scala.io.Source
class AwesomeoCensor() extends Censor {
	
	def wordReplace():scala.collection.mutable.Map[String,String] = {
		val pairs = scala.collection.mutable.Map[String,String]()
		for(line <- Source.fromFile("censor.csv").getLines()){
			val pair=line.split(",")
			pairs(pair(0)) = pair(1)
		}
		 
		return pairs
	}

	def filter(value:String): String={
		filter(wordReplace,value)
	}
}

val a = new AwesomeoCensor()
val x = List("Shoot","NonCurseWord")
x.foreach((item) =>{ println(a.filter(item)) })