class CreateInspectionViolation < ActiveRecord::Migration[4.2]

  def change
    create_table :inspection_violations do |t|
      t.string :violation_code
      t.string :camis
      t.datetime :inspection_date
    end
  end
end
