def restaurant_data_format(name)
  if name != nil
    name.downcase.gsub(/\s+/, "")
  end
end

def return_data_format(name)
  name.split.map{|word| word.downcase.capitalize}.join(" ")
end

def throw_error
  "You have entered an invalid selection."
end


def introduction
  "
  |           ***********           ***********          ***********          |
  |                                                                           |
  |                                                                           |
  |        Hello, and welcome to HII, the Health Inspection Inspector.        |
  |___________________________________________________________________________|



"
end

def menu
  "                  - Your options are as follows -
         1. Find the most recent inspection for a restaurant
         2. Find the most sanitary restaurants in your area
         3. Find all restaurants in your area with rat and rodent violations
         4. Find the most sanitary restaurant in your area by cuisine
            (select your option by number please)"
end

def get_input
  gets.chomp
end

def selection(input)
  "You have selected #{input}"
end

def menu_input(input)
  case input
  when "1"
    user_story_one
  when "2"
    puts "2"
  when "3"
    user_story_three
  when "4"
    user_story_four
  else
    puts "That is not a valid selection. Please enter a number 1 - 4"
  end
end

def runner
puts introduction
puts menu
puts menu_input(get_input)
end
#
#runner

def rat
  puts "         __             _,-\"~^\"-.
       _// )      _,-\"~`         `.
     .\" ( /`\"-,-\"`                 ;
    / 6                             ;
   /           ,             ,-\"     ;
  (,__.--.      \           /        ;
   //'   /`-.\   |          |        `._________
     _.-'_/`  )  )--...,,,___\     \-----------,)
   (((\"~` _.-'.-'           __`-.   )         //
     jgs (((\"`             (((---~\"`         //
                                            ((________________"
end

def return_to_menu_or_exit
  puts "Would you like to return to the menu or exit?"
  puts "Enter \'menu\' or \'exit\'"
  input = gets.chomp
  until input == "exit" || input == "menu" do
    puts "Incomplete command. Please enter either \'menu\' or \'exit\'"
    input = gets.chomp
  end
  if input == "exit"
    puts "\nGoodbye!"
  elsif input == "menu"
    runner
  end
end
