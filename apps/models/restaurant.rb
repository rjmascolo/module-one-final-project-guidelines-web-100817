class Restaurant < ActiveRecord::Base
  has_many :inspections
  has_many :violations, through: :inspections



def address
 "#{self.building} #{self.street} #{self.zipcode}"
end

def self.find_latest_inspection_by_name_and_zipcode(name, zipcode)
  restaurant = Restaurant.find_by(name: name, zipcode: zipcode)
  if restaurant == nil
    "No records found. Please check the restaurant name and zipcode and try again."
  else
  "The restaurants last inspection was on #{Date.parse(restaurant.inspections[0].inspection_date)}
    Its score was #{restaurant.inspections[0].score}.
    Its grade was #{restaurant.inspections[0].grade}."
  end
end

def self.find_restaurant_by_zipcode(zipcode)
  Restaurant.where(zipcode: zipcode)
end

def self.find_most_sanitary_restaurant_by_zipcode(zipcode)
  score = 0
  restaurant_name= ""
  restaurants_in_zip = find_restaurant_by_zipcode(zipcode)
  restaurants_in_zip.each do |restaurant|
    if restaurant.inspections[0].score > score
      restaurant_name = restaurant
    end
  end
  restaurant_name.name
end

def self.find_rodents_by_zipcode(zipcode)
  restaurants_in_zip = find_restaurant_by_zipcode(zipcode)
  restaurants_with_rodents = restaurants_in_zip.select do |restaurant|
    violation = restaurant.inspections[0].violations[0].violation_code
   violation == "08A" || violation == "04L" || violation == "04K"
  end
  restaurants_with_rodents.map {|restaurant| "#{restaurant.name}, #{restaurant.address}"}
end




end
