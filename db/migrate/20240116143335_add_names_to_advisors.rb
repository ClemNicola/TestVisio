class AddNamesToAdvisors < ActiveRecord::Migration[7.1]
  def change
    add_column :advisors, :first_name, :string
    add_column :advisors, :last_name, :string
  end
end
