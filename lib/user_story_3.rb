def user_story_four
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode = gets.chomp
  Restaurant.find_rodents_by_zipcode(zipcode)

end
