class AddUserIdToPrescriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :prescriptions, :user_id, :integer
  end
end
