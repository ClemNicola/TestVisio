class AddIsAdvisorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_advisor, :boolean, default: false
  end
end
