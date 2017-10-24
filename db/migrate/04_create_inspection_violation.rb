class CreateInspectionViolation < ActiveRecord::Migration[4.2]

  def change
    create_table :inspection_violations, id: false do |t|
      t.string :violation_code
      t.string :restaurant_id
      t.datetime :inspection_date
    end
  end
end
