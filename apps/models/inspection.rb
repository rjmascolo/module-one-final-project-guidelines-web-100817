class Inspection < ActiveRecord::Base
  belongs_to :restaurant, :foreign_key => 'restaurant_id', :primary_key => 'restaurant_id'
  #  belongs_to :coach, :foreign_key => 'user_name', :primary_key => 'user_name'
  has_many :inspection_violations
  has_many :violations, through: :inspection_violations

end
