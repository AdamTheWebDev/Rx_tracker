class ChangeIntegerLimitInPrescriptions < ActiveRecord::Migration[5.0]
  def change
    change_column :prescriptions, :ndc, :integer, limit: 8
  end
end
