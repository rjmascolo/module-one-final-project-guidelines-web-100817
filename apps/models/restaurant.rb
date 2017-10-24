class Restaurant < ActiveRecord::Base
  has_many :inspections
  has_many :violations, through: :inspections

end
