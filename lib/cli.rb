def restaurant_data_format(name)
  name.downcase.gsub(/\s+/, "")
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
         3. Find the most sanitary restaurant in your area by cuisine
         4. Find all restaurants in your area with rat and rodent violations
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
    puts "1"
  when "2"
    puts "2"
  when "3"
    puts "3"
  when "4"
    puts "4"
  else
    puts "That is not a valid selection. Please enter a number 1 - 4"
  end
end

def runner
puts introduction
puts menu
puts menu_input(get_input)
end
