class Restaurant < ActiveRecord::Base
  has_many :inspections
  has_many :violations, through: :inspections


## Dick's Section Begins Here ##
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


###  need to update to find most recent inspection - ryan has code for this ###
def self.find_rodents_by_zipcode(zipcode)
  restaurants_in_zip = find_restaurant_by_zipcode(zipcode)
  restaurants_with_rodents = restaurants_in_zip.select do |restaurant|
    violation = restaurant.inspections[0].violations[0].violation_code
   violation == "08A" || violation == "04L" || violation == "04K"
  end
  restaurants_with_rodents.map {|restaurant| "#{restaurant.name}, #{restaurant.address}"}
end
## Dick's Section Ends Here ##



end
