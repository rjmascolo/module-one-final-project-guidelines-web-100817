def restaurant_seed
  restaurants.each { |x| Restaurant.create(x) }
end

def inspection_seed
  inspection.each { |x| Inspection.create(x) }
end

def violations_seed
  violations.each { |x| Violation.create(x) }
end

def inspection_violations_seed
  inspection_violation.each { |x| Inspection_violation.create(x) }
end

restaurant_seed

inspection_seed

violations_seed

inspection_violations_seed
