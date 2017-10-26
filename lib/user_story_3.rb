def user_story_three
  system('clear')
  puts rat
  puts ""
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode = gets.chomp
  Inspection.find_rodents_by_zipcode(zipcode)

end
