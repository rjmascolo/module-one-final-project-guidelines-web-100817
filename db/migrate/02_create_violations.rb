class CreateViolations < ActiveRecord::Migration[4.2]


  def change
    create_table :violations, id: false do |t|
      t.string :violation_code
      t.string :violation_description
    end
  end
end
