@player1_lives = 3
@player2_lives = 3
@current_player = 1
 
def check_lives() 
  (@player1_lives > 0) && (@player2_lives > 0) 
end
 
def get_answer(operator, x, y) 
  if (operator == 1) 
    operator = " + "
  elsif (operator == 2) 
    operator = " - "
  else 
    operator = " x "
  end

  puts "Player #{@current_player}: What does #{x}#{operator}#{y} equal?"
  gets.chomp.to_i
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
 
def switch_player() 
  if (@current_player == 1) 
    @current_player = 2
    puts("You have " + @player1_lives.to_s + " lives remaining")
  else 
    @current_player = 1
    puts("You have " + @player2_lives.to_s + " lives remaining")
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
  if (answer == right_answer) 
    puts("Correct.")
  else 
    if (@current_player == 1) 
      @player1_lives -= 1
      puts("Wrong! " + @player1_lives.to_s + " lives left!")
    else 
      @player2_lives -= 1
      puts("Wrong! " + @player2_lives.to_s + " lives left!")
    end
  end
end

 
  

while (@player1_lives > 0) && (@player2_lives > 0) 

  x  = rand(20) + 1
  y  = rand(20) + 1
  op = rand(3) + 1

  right_answer = calculate_answer(op, x, y)
  answer = get_answer(op, x, y)
 
  check_answer(answer, right_answer)
  switch_player()

end 

announce_winner()
  

  