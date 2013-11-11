@player1_lives = 3
@player2_lives = 3
@currentplayer = 1
 
def checkLives() 
  if ((@player1Lives > 0) && (@player2Lives > 0)) {
    return true
  } else {
    return false
  }
end
 
def getAnswer(operator, x, y) 
  if (operator == 1) {
    operator = " + "
  } elsif (operator == 2) {
    operator = " - "
  } else {
    operator = " x "
  }
end
 
  return gets.chomp("Player " + @currentPlayer + ": What does " + x + operator + y + " equal?")
}
 
def switchPlayer() 
  if (@currentPlayer == 1) {
    @currentPlayer = 2
    puts("You have " + @player1Lives + " lives remaining")
  } else {
    @currentPlayer = 1
    puts("You have " + @player2Lives + " lives remaining")
  }
end
 
def calculateAnswer(op, x, y) 
  if (op == 1) {
    return x + y
  } elsif (op == 2) {
    return x - y
  } else {
    return x * y
  }
end
 
def announceWinner() 
  if (@player1Lives == 0) {
    puts("Player 2 wins!")
  } else {
    puts("Player 1 wins!")
  }
end
 
def checkAnswer(answer, rightAnswer) 
  if (answer == rightAnswer) {
    puts("Correct.")
  } else {
    if (@currentPlayer == 1) {
      player1Lives -= 1
      puts("Wrong! " + @player1Lives + " lives left!")
    } else {
      player2Lives -= 1
      puts("Wrong! " + @player2Lives + " lives left!")
    }
  }
end
 
 
do {
 
  x  = rand(20) + 1
  y  = rand(20) + 1
  op = rand(3) + 1
  
  rightAnswer = calculateAnswer(op, x, y)
  answer = getAnswer(op, x, y
 
  checkAnswer(answer, rightAnswer);
  switchPlayer()
 
} while (checkLives() == true )
 
announceWinner()