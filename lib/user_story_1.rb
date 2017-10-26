def user_story_one
  puts "Enter the name of the restaurant you'd like the report for."
  name = gets.chomp
  puts "
  Enter the zip code of the restaurant you'd like the report for."
  zipcode = gets.chomp
  puts ""
  puts Restaurant.find_latest_inspection_by_name_and_zipcode(name, zipcode)
  puts ""
  return_to_menu_or_exit
end
