class Inspection_violation < ActiveRecord::Base
  belongs_to :inspection
  belongs_to :violation
  
end
