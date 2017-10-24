class Restaurant < ActiveRecord::Base
  has_many :inspections
  has_many :violations, through: :inspections
########## Ryan's Section ############
  def self.most_sanitary_in_area_by_cuisine(zipcode, cuisine)
    #finds restaurants in zipcode with a cuisine type
    in_area = self.restaurant_type_in_zip(zipcode,cuisine)

    # finds the the inspection score of the restaurants last inspection
    #placer data that will keep track of who wone
    winning_score = 1000
    best_restaurant = ""
    #check each restaurant to see which one has the lowest score
    in_area.each do |obj|
      #need to find the latest inspection report
      if obj.inspections.length > 1
        last_date = "0"
        obj.inspections.each { |inspec_obj| inspec_obj[:inspection_date] > last_date ? last_date = inspec_obj[:inspection_date] : nil }
        last_inspection = obj.inspections.where(inspection_date: last_date)
        if last_inspection[0].score < winning_score
          winning_score = last_inspection[0].score
          best_restaurant = obj.name
        end
      elsif last_inspection[0].score < winning_score
        winning_score = last_inspection[0].score
        best_restaurant = obj.name
      end
    end
    return "#{winning_score} #{best_restaurant}"
  end

  def self.restaurant_type_in_zip(zipcode,cuisine)
    self.where(zipcode: zipcode).where(cuisine: cuisine)
  end

  def self.more_than_one_inspection?
    self.all.select { |r| r.inspections.length > 1 }
  end

  def self.most_populated_zip_of_cuisine(cuisine)
    x = self.where(cuisine: cuisine).group(:zipcode).count
    x.sort_by { |name, age| age }
  end
######### Ryan's section ending ###################


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


## Not Finished, but in progress ##
def most_recent_inspection
  self.inspections.maximum(:inspection_date)
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
