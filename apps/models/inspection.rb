class Inspection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :inspection_violations
  has_many :violations, through: :inspection_violations

  # User case 4: this function returns the top 5 restaurants in the zipcode
  def self.resturant_info_of_top_five_inspections_by_zipcode(zipcode)
    array = self.most_recent_inspection_and_minimum_score_in_areacode(zipcode).take(5)
    array.map { |inspection| inspection.restaurant }
  end

  #helper method
  def self.inspections_ordered_by_scores
    self.order(:score).where("score IS NOT NULL")
  end

  def self.filter_by_cuisine(cuisine)
    includes(:restaurant).where(restaurants: {cuisine: cuisine})
  end

  def self.filter_by_zipcode(zipcode)
    includes(:restaurant).where(restaurants: {zipcode: zipcode})
  end

  def self.minimum_score_in_areacode(zipcode)
    self.filter_by_zipcode(zipcode).inspections_ordered_by_scores
  end

  def self.most_recent_inspection_and_minimum_score_in_areacode(zipcode)
    self.minimum_score_in_areacode(zipcode).select {|e| e.most_recent_inspection?}
  end

  def most_recent_inspection?
    self.restaurant.most_recent_inspection == self ? true : false
  end

  def full_violation_codes
    self.violations.map {|violation|violation.violation_code}
  end

  def self.find_rodents_by_zipcode(zipcode)
     restaurants_in_zip = filter_by_zipcode(zipcode.to_s)
     rodent_violation_codes = ["04L", "04K"]
    restaurants_with_rodents = restaurants_in_zip.select do |inspection|
      binding.pry
      inspection.full_violation_codes & rodent_violation_codes != []
    end
    binding.pry
    if restaurants_with_rodents == []
      "No restaurants with rodents found in #{zipcode}"
    else
      restaurants_with_rodents.map do |inspection|
        "#{return_data_format(inspection.restaurant.name)}, #{inspection.restaurant.address_without_zipcode}"
      end
    end
  end

end
