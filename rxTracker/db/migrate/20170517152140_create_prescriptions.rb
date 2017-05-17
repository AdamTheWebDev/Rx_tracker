class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.date :date
      t.string :prescriber
      t.string :strength
      t.string :directions
      t.integer :refills
      t.integer :ndc

      t.timestamps
    end
  end
end
