require 'rest-client'
require 'json'
require 'pry'

def fetch_data_on_restaurants
  restaurants = RestClient.get("https://data.cityofnewyork.us/resource/9w7m-hzhe.json")
  restaurants_parsed = JSON.parse(restaurants)
end

def restaurants
  data = fetch_data_on_restaurants
  data.map do |c|
    {
      restaurant_id: c["camis"],
      name: c["dba"],
      cuisine: c["cuisine_description"],
      zipcode: c["zipcode"],
      street: c["street"],
      building: c["building"],
      phone_number: c["phone"]
    }
  end
end

def violations
  data = fetch_data_on_restaurants
  data.map do |c|
    {
      violation_code: c["violation_code"],
      violation_description: c["violation_description"]
    }
  end.uniq
end

def inspection
    data = fetch_data_on_restaurants
    data.map do |c|
      {
        inspection_date: c["inspection_date"],
        inspection_type: c["inspection_type"],
        restaurant_id: c["camis"],
        score: c["score"],
        grade: c["grade"],
        grade_date: c["grade_date"],
        action: c["action"]
      }
    end.uniq
end

def inspection_violation
  data = fetch_data_on_restaurants
  data.map do |c|
    {
      violation_code: c["violation_code"],
      restaurant_id: c["camis"],
      inspection_date: c["inspection_date"]
    }
  end
end
