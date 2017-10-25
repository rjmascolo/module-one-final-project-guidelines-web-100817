class Restaurant < ActiveRecord::Base
  has_many :inspections
  has_many :violations, through: :inspections

########## Ryan's Section ############
  def self.most_sanitary_in_area_by_cuisine(zipcode, cuisine)
    in_area = self.restaurant_type_in_zip(zipcode.to_s ,cuisine)
    last_inspections = {}
    in_area.each do |obj|
      last_inspect = obj.most_recent_inspection
      last_inspections[last_inspect.id] = last_inspect.score
    end
    restaurant_id = [last_inspections.min_by{|k, v| v}].to_h.keys[0]
    self.find(restaurant_id)
  end

  def self.restaurant_type_in_zip(zipcode,cuisine)
    self.where(zipcode: zipcode.to_s).where(cuisine: cuisine)
  end

  def self.most_populated_zip_of_cuisine(cuisine)
    x = self.where(cuisine: cuisine).group(:zipcode).count
    x.sort_by { |name, age| age }
  end

  def self.zipcodes_of_restuarants
    self.all.map{ |obj| obj.zipcode }.uniq
  end

######### Ryan's section ending ###################


## Dick's Section Begins Here ##
def address
 "#{self.building} #{return_data_format(self.street)} #{self.zipcode}"
end

def address_without_zipcode
   "#{self.building} #{return_data_format(self.street)}"
end

def grade_return(grade)
 case grade
 when "A"
   "Its grade was an A."
 when "B"
   "Its grade was a B."
 when "C"
   "Its grade was a C."
 when "Z"
   "The restaurant is listed as \"Grade Pending\"."
 when "P"
   "The restaurant is listed as \"Grade Pending\" after having been shut down in the past for violations."
 else
   "No grade is available for this restauarant."
 end
end

def self.find_latest_inspection_by_name_and_zipcode(name, zipcode)
restaurant = Restaurant.all.select do |rest|
    restaurant_data_format(rest.name) == restaurant_data_format(name) && rest.zipcode == zipcode.to_s
  end[0]
  if restaurant == nil
    "No records found. Please check the restaurant name and zipcode and try again."
  else
  "The restaurants last inspection was on #{Date.parse(restaurant.most_recent_inspection.inspection_date)}
    Its score was #{restaurant.most_recent_inspection.score}.
    #{restaurant.grade_return(restaurant.most_recent_inspection.grade)}"
  end
end


def self.find_restaurant_by_zipcode(zipcode)
  Restaurant.where(zipcode: zipcode)
end


## Not Finished, but in progress ##
def most_recent_inspection_date
  self.inspections.maximum(:inspection_date)
end

def most_recent_inspection
  last_date = most_recent_inspection_date
  self.inspections.where(inspection_date:last_date).first
end

def violation_codes_from_most_recent_inspection
  violation_array = self.most_recent_inspection.violations
  violation_array.map {|violation| violation.violation_code}
end


def self.find_rodents_by_zipcode(zipcode)
  restaurants_in_zip = find_restaurant_by_zipcode(zipcode.to_s)
  rodent_violation_codes = ["08A", "04L", "04K"]
  restaurants_with_rodents = restaurants_in_zip.select do |restaurant|
    restaurant.violation_codes_from_most_recent_inspection & rodent_violation_codes != []
  end
  restaurants_with_rodents.map {|restaurant| "#{return_data_format(restaurant.name)}, #{restaurant.address_without_zipcode}"}
end
## Dick's Section Ends Here ##




end
