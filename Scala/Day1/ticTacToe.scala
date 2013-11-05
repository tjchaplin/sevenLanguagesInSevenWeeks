import java.io.{BufferedReader, InputStreamReader}

class WinnerValidator(board:Array[Array[String]]){
	
	def validate(): Boolean={
		if(isRowAWinner)
			return true

		if(isColumnAWinner)
			return true

		if(isDiagnolAWinner)
			return true

		return false
	}

	def isRowAWinner:Boolean={
		for(i <- 0 until board.length){
			if(board(i)(0) != " " && board(i)(0) == board(i)(1) && board(i)(1) == board(i)(2))
				return true		
		}
		return false
	}

	def isColumnAWinner:Boolean={
		for(j <- 0 until board.length){
			if(board(0)(j) != " " && board(0)(j) == board(1)(j) && board(1)(j) == board(2)(j))
				return true	
		}

		return false
	}

	def isDiagnolAWinner():Boolean={
		val centerValue = board(1)(1)
		val topLeft = board(0)(0)
		val bottomLeft = board(2)(0)
		val topRight = board(0)(2)
		val bottomRight = board(2)(2)

		if(centerValue == " ")
			return false

		if(centerValue == topLeft && centerValue == bottomRight)
			return true

		if(centerValue == topRight && centerValue == bottomLeft)
			return true

		return false
	}
}

class GameBoard(){
	val board = Array(Array(" "," "," "),
				   Array(" "," "," "),
				   Array(" "," "," "))

	def markPosition(position:Position, value:String){
		board(position.row)(position.column) = value
	}

	def canMarkPosition(position:Position): Boolean={
		if(position.row >= board.length)
			return false

		if(position.column >= board(position.row).length)
			return false

		if(board(position.row)(position.column) == " ")
			return true

		return false
	}


	def display{
		val separator = "\n---------\n"
		print(separator)
		for(i <- 0 until board.length){
			for(j <- 0 until board(i).length){
				print("|"+board(i)(j)+"|")
			}
			print(separator)
		}

	}
}

class Player(id:String, marker: String){
	def id(): String = id
	def marker(): String = marker
}

class Position(row:Int,column:Int){
	def row(): Int = row
	def column(): Int = column
}

class TicTacToe(){
	val gameBoard = new GameBoard()	

	val winnerValidator = new WinnerValidator(gameBoard.board)

	def getUserInput(player: Player): Position = {
		println("Your play type:RowNumber,ColNumber (X or O)")

		val stdin = new BufferedReader(new InputStreamReader(System.in))

		val line = stdin.readLine()
		val split = line.split(",")
		val position = new Position(split(0).toInt,split(1).toInt)
		return position
	}

	def playerPlay(player: Player): Boolean={
		var inputPosition = getUserInput(player)
		gameBoard.markPosition(inputPosition,player.marker)

		if(winnerValidator.validate){
			println("player"+player.id+" Won")
			return true
		}

		return false
	}

	def play(){
		val player1 = new Player("1","X")
		val player2 = new Player("2","O")
		var didWin = false
		while(!didWin){
			gameBoard.display
			if(playerPlay(player1))
				return
			
			gameBoard.display
			if(playerPlay(player2))
				return
		}
		gameBoard.display
	}

}

val game = new TicTacToe()
game.play