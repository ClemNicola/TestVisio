class RemoveUserFromAdvisors < ActiveRecord::Migration[7.1]
  def change
    remove_column :advisors, :user_id, :string
  end
end
