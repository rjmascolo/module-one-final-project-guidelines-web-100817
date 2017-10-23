require_relative "../lib/api_communicator.rb"

def restaurant_seed
  restaurants.each { |x| Restaurant.new(x) }
end

def inspection_seed
  inspection.each { |x| Inspection.new(x) }
end

def violations_seed
  violations.each { |x| Violation.new(x) }
end

def inspection_violations_seed
  inspection_violation.each { |x| Inspection_violation.new(x) }
end
