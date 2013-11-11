@player1_lives = 3
@player2_lives = 3
@current_player = 1
 
def check_lives() 
  if ((@player1_lives > 0) && (@player2_lives > 0)) 
    return true
   else 
    return false
  end
end
 
def get_answer(operator, x, y) 
  if (operator == 1) 
    operator = " + "
   elsif (operator == 2) 
    operator = " - "
   else 
    operator = " x "
  end
  # chomp() doesn't take arguments. You need to echo first and then "listen"
  # for the users input
  # http://ruby.learncodethehardway.org/book/ex14.html
  puts 'Player' + @current_player.to_s + ': What does ' + x.to_s + operator + y.to_s + ' equal?'
  return gets.chomp()
end

 # part of the below line is changed into Ruby but i'm not sure of syntax.

#gets.chomp('Player' + @current_player.to_s + ': What does ' + x + operator + y + ' equal?')

 
def switch_player() 
  if (@current_player == 1) 
    @current_player = 2
    #/!\ Attention, you can't mix numbers type and string type without
    # casting them
    puts("You have " + @player1_lives.to_s + " lives remaining")
   else 
    @current_player = 1
    #same here
    puts("You have " + @player2_lives.to_s + " lives remaining")
  end
end
 
def calculate_answer(op, x, y) 
  if (op == 1) 
    return x + y
   elsif (op == 2) 
    return x - y
   else 
    return x * y
  end
end
 
def announce_winner() 
  if (@player_1Lives == 0) 
    puts("Player 2 wins!")
   else 
    puts("Player 1 wins!")
  end
end
 
def check_answer(answer, right_answer) 
  # same here you can't compare a string and a number
  # it's either string == string or
  # number == number
  if (answer.to_s == right_answer.to_s) 
    puts("Correct.")
   else 
    if (@current_player == 1) 
      #missing @
      @player1_lives -= 1
      # wrong type again
      puts("Wrong! " + @player1_lives.to_s + " lives left!")
     else 
      #missing @
      @player2_lives -= 1
      puts("Wrong! " + @player2_lives.to_s + " lives left!")
    end
  end
end

# wrong while syntax
# breaks the game logic
while (check_lives() == true)
  x  = rand(20) + 1
  y  = rand(20) + 1
  op = rand(3) + 1

  right_answer = calculate_answer(op, x, y)
  answer = get_answer(op, x, y)

  check_answer(answer, right_answer)
  switch_player()
  
end

announce_winner()
