#this file is for the user story 2.

def returns_most_sanitary_rest_in_zip_and_cuisine
  puts "What zipcode are you searching for food in?"
  zipcode_input = gets.chomp
   if !valid_zipcode?(zipcode_input)
     puts "That is an invalid zipcode. Please try again"
     returns_most_sanitary_rest_in_zip_and_cuisine
  end
  puts "What type of cuisine would you like?"
  puts "Below are some options in your neighborhood"
  cusine_options_in_neighborhood(zipcode_input)
  cuisine_input = get_input
  list_of_restaurants = Restaurant.most_sanitary_in_area_by_cuisine(zipcode, cuisine)
end


def valid_zipcode?(zipcode)
  Restaurant.zipcodes_of_restuarants.any?(zipcode)
end

def cusine_options_in_neighborhood(zipcode)
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
end

returns_most_sanitary_rest_in_zip_and_cuisine
