class Inspection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :inspection_violations
  has_many :violations, through: :inspection_violations

end
