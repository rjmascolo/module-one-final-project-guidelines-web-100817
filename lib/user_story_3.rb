def user_story_three
  system('clear')
  puts rat
  puts ""
  
  Inspection.find_rodents_by_zipcode(gets_rodent_zip)

end


def gets_rodent_zip
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode_input = gets.chomp
   while !valid_zipcode?(zipcode_input)
     zipcode_input = gets.chomp
   end
   zipcode_input
end
