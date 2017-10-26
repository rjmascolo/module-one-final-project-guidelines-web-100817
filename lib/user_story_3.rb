def user_story_three
  system('clear')
  puts rat
  puts ""
<<<<<<< HEAD
  
  Inspection.find_rodents_by_zipcode(gets_rodent_zip)

end


def gets_rodent_zip
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode_input = gets.chomp
   while !valid_zipcode?(zipcode_input)
     zipcode_input = gets.chomp
   end
   zipcode_input
=======
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode = gets.chomp
  Inspection.find_rodents_by_zipcode(zipcode)
  return_to_menu_or_exit
>>>>>>> 5b8ca8d42a294844dc7cd1fa4fc8b79029a21fe4
end
