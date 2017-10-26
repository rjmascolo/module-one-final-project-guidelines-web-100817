#this file is for the user story 2.

def returns_most_sanitary_rest_in_zip_and_cuisine
  zipcode_input = retrive_the_zipcode
  cusine_options_in_neighborhood(zipcode_input)
  cuisine_input = retrive_the_cuisine(zipcode_input)
  return_winning_restaurant(zipcode_input, cuisine_input)
  return_to_menu_or_exit
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

def return_winning_restaurant(zipcode, cuisine)
  winning_restaurant = Restaurant.most_sanitary_in_area_by_cuisine(zipcode, cuisine)
  puts "\nRestaurant: #{return_data_format(winning_restaurant.name)} \nLast Inspection Score: #{winning_restaurant.most_recent_inspection.score} \n\n"
end

def retrive_the_cuisine(zipcode)
  puts "\nWhat type of cuisine would you like?\n"
  cuisine_input = gets.chomp
  while !valid_cuisine_type?(cuisine_input, zipcode)
    puts "That is not a valid cuisine type. Please try again."
    cuisine_input = gets.chomp
  end
  cuisine_input
end

def valid_cuisine_type? (cuisine, zipcode)
  Restaurant.cuisine_available_in_zipcode(zipcode).any?{ |word| word.downcase == cuisine.downcase }
end

def cusine_options_in_neighborhood(zipcode)
  puts ""
  array = Restaurant.cuisine_available_in_zipcode(zipcode).sort
  array.each_with_index do |value, index|
    if index == 0 || (index) % 3 == 0
      if array.length < index + 3
        if array.length == index + 1
          puts "#{value}"
        else
          puts "#{value}   ||  #{array[index+1]}"
        end
      else
        puts "#{value}  ||  #{array[index + 1]}  ||  #{array[index + 2]}  "
      end
    end
  end
    puts "\nAbove are some options in your neighborhood:"
end
