class Restaurant < ActiveRecord::Base
  has_many :inspections, :foreign_key => 'restaurant_id', :primary_key => 'restaurant_id'
  has_many :violations, through: :inspections

end
