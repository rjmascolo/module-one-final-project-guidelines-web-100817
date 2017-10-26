def user_story_three
  puts "Enter the zip code that you'd like a rodent report for."
  zipcode = gets.chomp
  Inspection.find_rodents_by_zipcode(zipcode)
  return_to_menu_or_exit
end
