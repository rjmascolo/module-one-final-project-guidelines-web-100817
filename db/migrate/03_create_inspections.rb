class CreateInspections < ActiveRecord::Migration[4.2]

  def change
    create_table :inspections do |t|
      t.datetime :inspection_date
      t.string :inspection_type
      t.string :restaurant_id
      t.integer :score
      t.string :grade
      t.datetime :grade_date
      t.string :action
    end
  end
end
