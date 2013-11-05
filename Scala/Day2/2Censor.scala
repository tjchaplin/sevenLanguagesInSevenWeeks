trait Censor{
	def filter(wordReplace:Map[String, String],value:String): String = {
		if(wordReplace.contains(value))
			return wordReplace(value)

		return value
	}
}

class AwesomeoCensor() extends Censor {
	val wordReplace  = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

	def filter(value:String): String={
		filter(wordReplace,value)
	}
}

val a = new AwesomeoCensor()
val x = List("Shoot","NonCurseWord")
x.foreach((item) =>{ println(a.filter(item)) })