class RemoveIsAdvisorFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :is_advisor, :boolean
  end
end
