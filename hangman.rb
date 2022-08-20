$hangman = ["  +---+\n  |   |\n      |\n      |\n      |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n      |\n      |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n  |   |\n      |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n /|   |\n      |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n /|\\  |\n      |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n /|\\  |\n /    |\n      |\n=========",
          "  +---+\n  |   |\n  O   |\n /|\\  |\n / \\  |\n      |\n========="]
FILE = File.open("words.txt")
WORDS = FILE.read.split("\n")
$ANSWER = []
$mistakes = 0

def start()
  $mistakes = 0
  puts "==== Welcome to Hangman ==="
  puts "You have 6 life to guess the correct word"
  puts "If you fail to choose the correct word you will loose the game."

  $word = WORDS[rand(0...WORDS.length)].chars
  print $word
  puts "Your word is : "
  puts "================================="
  $word.each do |x|
    print " _ "
    $ANSWER << 0
  end

  puts ""
end

def game()
  start()
  until $mistakes == 6
    unless $ANSWER.include?(0)
      puts "#### Congratulations on winning the game ! ####"
      break
    end
    begin
      puts "================================="
      print "Your Choice: "
      choice = gets.chomp
      raise if choice.length != 1

      correct = false
      $word.each_with_index do | value, index |
        if choice == value
          $ANSWER[index] = 1
          correct = true
        end
      end
        unless correct
          puts ""
          puts "================================="
          puts "Incorrect Answer. Life left #{6 - $mistakes-1}"
          puts "================================="
          $mistakes += 1
          puts $hangman[$mistakes]
        end
        puts "================================="
      $ANSWER.each_with_index do |value, index|
        if value == 1
          print $word[index]
        else
          print " _ "
        end
      end
      puts ""
    rescue => e
      puts "Please enter the single word only. #{e.message}"
    end
  end
  puts "=== Game Over ! ==="
end

game()
